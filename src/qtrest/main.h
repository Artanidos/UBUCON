#ifndef MAIN_H
#define MAIN_H

#include <QtGlobal> 
#include <QDialog>
#include <QUrl> 
#include <QNetworkAccessManager> 
#include <QNetworkReply>
#include <QNetworkRequest>

class Main : public QDialog
{
    Q_OBJECT

public:
    explicit Main(QWidget *parent = nullptr);

private slots:
    void httpReadyRead();
    void httpFinished();

private:
    QNetworkAccessManager *restclient;
    QNetworkReply *reply;
};

#endif