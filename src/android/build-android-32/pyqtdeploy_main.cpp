#include <Python.h>
#include <QtGlobal>


extern "C" PyObject *PyInit_Qt(void);
extern "C" PyObject *PyInit_QtAndroidExtras(void);
extern "C" PyObject *PyInit_QtBluetooth(void);
extern "C" PyObject *PyInit_QtCore(void);
extern "C" PyObject *PyInit_QtGui(void);
extern "C" PyObject *PyInit_QtNetwork(void);
extern "C" PyObject *PyInit_QtQml(void);
extern "C" PyObject *PyInit_QtQuick(void);
extern "C" PyObject *PyInit_QtQuickWidgets(void);
extern "C" PyObject *PyInit_QtSensors(void);
extern "C" PyObject *PyInit_QtSvg(void);
extern "C" PyObject *PyInit_QtWidgets(void);
extern "C" PyObject *PyInit_sip(void);
extern "C" PyObject *PyInit__abc(void);
extern "C" PyObject *PyInit__bisect(void);
extern "C" PyObject *PyInit__blake2(void);
extern "C" PyObject *PyInit__datetime(void);
extern "C" PyObject *PyInit__hashlib(void);
extern "C" PyObject *PyInit__heapq(void);
extern "C" PyObject *PyInit__json(void);
extern "C" PyObject *PyInit__pickle(void);
extern "C" PyObject *PyInit__posixsubprocess(void);
extern "C" PyObject *PyInit__queue(void);
extern "C" PyObject *PyInit__random(void);
extern "C" PyObject *PyInit__sha3(void);
extern "C" PyObject *PyInit__socket(void);
extern "C" PyObject *PyInit__ssl(void);
extern "C" PyObject *PyInit__struct(void);
extern "C" PyObject *PyInit_binascii(void);
extern "C" PyObject *PyInit_math(void);
extern "C" PyObject *PyInit_select(void);
extern "C" PyObject *PyInit_termios(void);
extern "C" PyObject *PyInit_zlib(void);

static struct _inittab extension_modules[] = {
    {"PyQt5.Qt", PyInit_Qt},
    {"PyQt5.QtAndroidExtras", PyInit_QtAndroidExtras},
    {"PyQt5.QtBluetooth", PyInit_QtBluetooth},
    {"PyQt5.QtCore", PyInit_QtCore},
    {"PyQt5.QtGui", PyInit_QtGui},
    {"PyQt5.QtNetwork", PyInit_QtNetwork},
    {"PyQt5.QtQml", PyInit_QtQml},
    {"PyQt5.QtQuick", PyInit_QtQuick},
    {"PyQt5.QtQuickWidgets", PyInit_QtQuickWidgets},
    {"PyQt5.QtSensors", PyInit_QtSensors},
    {"PyQt5.QtSvg", PyInit_QtSvg},
    {"PyQt5.QtWidgets", PyInit_QtWidgets},
    {"PyQt5.sip", PyInit_sip},
    {"_abc", PyInit__abc},
    {"_bisect", PyInit__bisect},
    {"_blake2", PyInit__blake2},
    {"_datetime", PyInit__datetime},
    {"_hashlib", PyInit__hashlib},
    {"_heapq", PyInit__heapq},
    {"_json", PyInit__json},
    {"_pickle", PyInit__pickle},
    {"_posixsubprocess", PyInit__posixsubprocess},
    {"_queue", PyInit__queue},
    {"_random", PyInit__random},
    {"_sha3", PyInit__sha3},
    {"_socket", PyInit__socket},
    {"_ssl", PyInit__ssl},
    {"_struct", PyInit__struct},
    {"binascii", PyInit_binascii},
    {"math", PyInit_math},
    {"select", PyInit_select},
    {"termios", PyInit_termios},
    {"zlib", PyInit_zlib},
    {NULL, NULL}
};


extern int pyqtdeploy_start(int argc, char **argv,
        struct _inittab *extension_modules, const char *main_module,
        const char *entry_point, const char **path_dirs);

int main(int argc, char **argv)
{
    return pyqtdeploy_start(argc, argv, extension_modules, "__main__", NULL, NULL);
}
