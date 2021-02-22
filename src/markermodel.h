#ifndef MARKERMODEL_H
#define MARKERMODEL_H

#include <QAbstractListModel>
#include <QGeoCoordinate>

class Mark : public QObject
{
  Q_OBJECT


public:
  explicit Mark(QGeoCoordinate coord, int status, QObject*parent = 0) :
    QObject(parent)
  {
    m_coord = coord;
    m_status = status;  
  }

  int status() {return m_status;}
  QGeoCoordinate coord() {return m_coord;}

private:
  QGeoCoordinate m_coord;
  int m_status;
};

class MarkerModel : public QAbstractListModel 
{
  Q_OBJECT

public:
  using QAbstractListModel::QAbstractListModel;
  enum MarkerRoles 
  { 
    positionRole = Qt::UserRole + 1, 
    statusRole = Qt::UserRole + 2
  };

  Q_INVOKABLE void addMarker(double latitude, double longitude, int status) 
  {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_marks.append(new Mark(QGeoCoordinate(latitude, longitude), status));
    endInsertRows();
  }

  int rowCount(const QModelIndex &parent = QModelIndex()) const override 
  {
    Q_UNUSED(parent)
    return m_marks.count();
  }

  QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override 
  {
    if (index.row() < 0 || index.row() >= m_marks.count())
      return QVariant();
    if (role == MarkerModel::positionRole)
      return QVariant::fromValue(m_marks[index.row()]->coord());
    else if (role == MarkerModel::statusRole)
      return QVariant::fromValue(m_marks[index.row()]->status());
    return QVariant();
  }

  QHash<int, QByteArray> roleNames() const override
  {
    QHash<int, QByteArray> roles;
    roles[positionRole] = "position";
    roles[statusRole] = "status";
    return roles;
  }

private:
  QList<Mark *> m_marks;
};

#endif // MARKERMODEL_H
