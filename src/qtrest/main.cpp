
#include <QtWidgets>
#include <main.h>

Main::Main(QWidget *parent)
    : QDialog(parent)
{
    setWindowTitle("QtRest");

    this->restclient = new QNetworkAccessManager(this);
    QUrl url;
    url.setScheme("https");
    url.setHost("diasporing.ch");
    url.setPath("/stream.json");
    //url.setQuery("");
    this->reply = restclient->get(QNetworkRequest(url));
    connect(this->reply, &QIODevice::readyRead, this, &Main::httpReadyRead);
    connect(this->reply, &QNetworkReply::finished, this, &Main::httpFinished);
}

void Main::httpReadyRead()
{
    qDebug() << reply->readAll();
}

void Main::httpFinished()
{
    if (this->reply->error()) 
    {
        qDebug() << "Load failed:" << this->reply->errorString();
        this->reply->deleteLater();
        this->reply = nullptr;
        return;
    }

    reply->deleteLater();
    reply = nullptr;
    qDebug() << "Finished";
}


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Main main;
    main.show();
    return app.exec();
}