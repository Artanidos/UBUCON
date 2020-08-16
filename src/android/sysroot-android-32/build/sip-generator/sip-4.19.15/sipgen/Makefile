TARGET = sip
OFILES = main.o transform.o gencode.o extracts.o export.o type_hints.o heap.o parser.o lexer.o
HFILES = sip.h parser.h

CC = gcc
CXX = g++
LINK = g++
CPPFLAGS = -DNDEBUG -I.
CFLAGS = -pipe -O2 -Wall -W
CXXFLAGS = -pipe -O2 -Wall -W
LFLAGS = 
LIBS = 
.SUFFIXES: .c .o .cpp .cc .cxx .C


.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.C.o:
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

all: $(TARGET)

$(OFILES): $(HFILES)

$(TARGET): $(OFILES)
	$(LINK) $(LFLAGS) -o $(TARGET) $(OFILES) $(LIBS)

install: $(TARGET)
	@test -d $(DESTDIR)/media/art/data/SourceCode/UBUCON/src/sysroot-android-32/host/bin || mkdir -p $(DESTDIR)/media/art/data/SourceCode/UBUCON/src/sysroot-android-32/host/bin
	cp -f $(TARGET) $(DESTDIR)/media/art/data/SourceCode/UBUCON/src/sysroot-android-32/host/bin/$(TARGET)
	@test -d $(DESTDIR)/media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7 || mkdir -p $(DESTDIR)/media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
	cp -f /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-generator/sip-4.19.15/siplib/sip.h $(DESTDIR)/media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7/sip.h

clean:
	-rm -f $(TARGET)
	-rm -f main.o
	-rm -f transform.o
	-rm -f gencode.o
	-rm -f extracts.o
	-rm -f export.o
	-rm -f type_hints.o
	-rm -f heap.o
	-rm -f parser.o
	-rm -f lexer.o
