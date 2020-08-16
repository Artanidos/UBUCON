#############################################################################
# Copyright (C) 2020 Olaf Japp
#
# This file is part of UBUCON.
#
#  UBUCON is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  UBUCON is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with UBUCON.  If not, see <http://www.gnu.org/licenses/>.
#
#############################################################################

import os
import inspect
import pathlib
import sys
import shutil
from importlib import import_module
from gui.flatbutton import FlatButton
from gui.expander import Expander
from gui.hyperlink import HyperLink
from gui.dashboard import Dashboard
from PyQt5.QtWidgets import QMessageBox, QVBoxLayout, QMainWindow, QWidget, QScrollArea, QDockWidget, QUndoStack, QApplication
from PyQt5.QtCore import pyqtSignal, Qt, QUrl, QRect, QCoreApplication, QDir, QSettings, QByteArray, QEvent, QPoint, QAbstractAnimation, QPropertyAnimation
from PyQt5.QtQml import QQmlEngine, QQmlComponent
from PyQt5.QtWebEngineWidgets import QWebEngineView
#import resources

class MainWindow(QMainWindow):
    #siteLoaded = pyqtSignal(object)

    def __init__(self):
        QMainWindow.__init__(self)
        self.install_directory = os.getcwd()
        self.initGui()
        self.readSettings()
        #self.loadPlugins()

        self.dashboard.setExpanded(True)
        self.showDashboard()
        self.statusBar().showMessage("Ready")

    def actualThemeChanged(self, themename):
        self.theme_settings_button.setVisible(False)
        for name in Plugins.themePluginNames():
            tei = Plugins.getThemePlugin(name)
            if tei:
                if tei.theme_name == themename:
                    self.theme_settings_button.setVisible(True)
                    break        
    
    def initGui(self):
        self.installEventFilter(self)
        self.dashboard = Expander("Dashboard", ":/images/dashboard_normal.png", ":/images/dashboard_hover.png", ":/images/dashboard_selected.png")
        self.content = Expander("Content", ":/images/pages_normal.png", ":/images/pages_hover.png", ":/images/pages_selected.png")
        self.appearance = Expander("Appearance", ":/images/appearance_normal.png", ":/images/appearance_hover.png", ":/images/appearance_selected.png")
        self.settings = Expander("Settings", ":/images/settings_normal.png", ":/images/settings_hover.png", ":/images/settings_selected.png")

        self.setWindowTitle(QCoreApplication.applicationName() + " " + QCoreApplication.applicationVersion())
        vbox = QVBoxLayout()
        vbox.addWidget(self.dashboard)
        vbox.addWidget(self.content)
        vbox.addWidget(self.appearance)
        vbox.addWidget(self.settings)
        vbox.addStretch()

        content_box = QVBoxLayout()
        pages_button = HyperLink("Pages")
        posts_button = HyperLink("Posts")
        content_box.addWidget(pages_button)
        content_box.addWidget(posts_button)
        self.content.addLayout(content_box)

        app_box = QVBoxLayout()
        themes_button = HyperLink("Themes")
        menus_button = HyperLink("Menus")
        self.theme_settings_button = HyperLink("Theme Settings")
        self.theme_settings_button.setVisible(False)
        app_box.addWidget(menus_button)
        app_box.addWidget(themes_button)
        app_box.addWidget(self.theme_settings_button)

        self.appearance.addLayout(app_box)

        scroll_content = QWidget()
        scroll_content.setLayout(vbox)
        scroll = QScrollArea()
        scroll.setHorizontalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        scroll.setVerticalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        scroll.setWidget(scroll_content)
        scroll.setWidgetResizable(True)
        scroll.setMaximumWidth(200)
        scroll.setMinimumWidth(200)

        self.navigationdock = QDockWidget("Navigation", self)
        self.navigationdock.setAllowedAreas(Qt.LeftDockWidgetArea | Qt.RightDockWidgetArea)
        self.navigationdock.setWidget(scroll)
        self.navigationdock.setObjectName("Navigation")

        self.addDockWidget(Qt.LeftDockWidgetArea, self.navigationdock)

        self.showDock = FlatButton(":/images/edit_normal.png", ":/images/edit_hover.png")
        self.showDock.setToolTip("Show Navigation")
        self.statusBar().addPermanentWidget(self.showDock)

        self.dashboard.expanded.connect(self.dashboardExpanded)
        self.dashboard.clicked.connect(self.showDashboard)
        self.content.expanded.connect(self.contentExpanded)
        self.content.clicked.connect(self.showPages)
        self.appearance.expanded.connect(self.appearanceExpanded)
        self.appearance.clicked.connect(self.showMenus)
        self.settings.expanded.connect(self.settingsExpanded)
        self.settings.clicked.connect(self.showSettings)
        menus_button.clicked.connect(self.showMenus)
        pages_button.clicked.connect(self.showPages)
        posts_button.clicked.connect(self.showPosts)
        themes_button.clicked.connect(self.showThemes)
        self.theme_settings_button.clicked.connect(self.showThemesSettings)
        self.showDock.clicked.connect(self.showMenu)
        self.navigationdock.visibilityChanged.connect(self.dockVisibilityChanged)

    def showDashboard(self):
        db = Dashboard(self.default_path)
        #db.loadSite.connect(self.loadProject)
        #db.previewSite.connect(self.previewSite)
        #db.publishSite.connect(self.publishSite)
        #db.createSite.connect(self.createSite)
        #db.buildSite.connect(self.buildSite)
        #self.siteLoaded.connect(db.siteLoaded)
        self.setCentralWidget(db)

    def setCentralWidget(self, widget):
        # do not delete plugin editors
        old_widget = self.takeCentralWidget()
        #if not isinstance(old_widget, PublisherInterface) and not isinstance(old_widget, ThemeEditorInterface):
        #    del old_widget
        super().setCentralWidget(widget)
        widget.show()

    def closeEvent(self, event):
        self.writeSettings()
        event.accept()

    def writeSettings(self):
        settings = QSettings(QSettings.IniFormat, QSettings.UserScope, QCoreApplication.organizationName(), QCoreApplication.applicationName())
        settings.setValue("geometry", self.saveGeometry())
        settings.setValue("state", self.saveState())
        
    def readSettings(self):
        settings = QSettings(QSettings.IniFormat, QSettings.UserScope, QCoreApplication.organizationName(), QCoreApplication.applicationName())
        geometry = settings.value("geometry", QByteArray())
        if geometry.isEmpty():
            availableGeometry = QApplication.desktop().availableGeometry(self)
            self.resize(availableGeometry.width() / 3, availableGeometry.height() / 2)
            self.move(int(((availableGeometry.width() - self.width()) / 2)), int((availableGeometry.height() - self.height()) / 2))
        else:
            self.restoreGeometry(geometry)
            self.restoreState(settings.value("state"))
        self.default_path = ""

 

    def dashboardExpanded(self, value):
        if value:
            self.content.setExpanded(False)
            self.appearance.setExpanded(False)
            self.settings.setExpanded(False)

    def contentExpanded(self, value):
        if value:
            self.dashboard.setExpanded(False)
            self.appearance.setExpanded(False)
            self.settings.setExpanded(False)

    def appearanceExpanded(self, value):
        if value:
            self.dashboard.setExpanded(False)
            self.content.setExpanded(False)
            self.settings.setExpanded(False)

    def settingsExpanded(self, value):
        if value:
            self.dashboard.setExpanded(False)
            self.content.setExpanded(False)
            self.appearance.setExpanded(False)

    def showMenus(self):
        if self.editor:
            self.method_after_animation = "showMenus"
            self.editor.closeEditor()
            return

        edit = MenuList(self, self.site)
        edit.editContent.connect(self.editMenu)
        self.setCentralWidget(edit)

    def showPages(self):
        if self.editor:
            self.method_after_animation = "showPages"
            self.editor.closeEditor()
            return

        list = ContentList(self.site, ContentType.PAGE)
        list.editContent.connect(self.editContent)
        self.setCentralWidget(list)

    def showPosts(self):
        if self.editor:
            self.method_after_animation = "showPosts"
            self.editor.closeEditor()
            return

        list = ContentList(self.site, ContentType.POST)
        list.editContent.connect(self.editContent)
        self.setCentralWidget(list)

    def showThemes(self):
        if self.editor:
            self.method_after_animation = "showThemes"
            self.editor.closeEditor()
            return

        tc = ThemeChooser(self, self.site)
        self.setCentralWidget(tc)

    def showThemesSettings(self):
        tei = Plugins.getThemePlugin(Plugins.actualThemeEditorPlugin())
        if tei:
            if self.editor:
                self.method_after_animation = "showThemesSettings"
                self.editor.closeEditor()
                return

            path = self.site.source_path
            tei.setWindow(self)
            tei.setSourcePath(path)
            self.setCentralWidget(tei)
        else:
            self.statusBar().showMessage("Unable to load plugin " + Plugins.actualThemeEditorPlugin())

    def showSettings(self):
        if self.editor:
            self.method_after_animation = "showSettings"
            self.editor.closeEditor()
            return

        sse = SiteSettingsEditor(self, self.site)
        self.setCentralWidget(sse)

    def showMenu(self):
        self.navigationdock.setVisible(True)

    def dockVisibilityChanged(self, visible):
        self.showDock.setVisible(not visible)