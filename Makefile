# (C) Copyright Kirill Lykov 2013.
#
# Distributed under the FreeBSD Software License (See accompanying file license.txt) 
#
# Make file for oni2avi. Check include and lib pathes before runing.

SHELL = /bin/sh
.SUFFIXES: .cpp .u
.IGNORE:

ROOT =  oni2avi
EXE =   $(ROOT)


UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
    INCLUDES = -I/usr/local/include/ni -I/usr/local/include/opencv
    LIBS_PATH = -L/usr/local/lib/
endif
ifeq ($(UNAME), Darwin)
    INCLUDES = -I/opt/local/include/ni -I/opt/local/include/opencv
    LIBS_PATH = -L/opt/local/lib/
endif

LIBS = -lOpenNI -lboost_system-mt -lboost_program_options-mt -lboost_filesystem-mt -lopencv_video -lopencv_highgui -lopencv_core -lopencv_imgproc -lopencv_contrib

CC = g++
CCFLAGS = -O2
LINK = g++
SRC = oni2src.cpp
OBJ = oni2avi.o

$(EXE):	$(OBJ)
	$(LINK) -o $(EXE) $(OBJ) $(LIBS_PATH) $(LIBS)

%.o:%.cpp
	$(CC) $(CCFLAGS) $(INCLUDES) -c $<

clean:
	rm -fr $(ROOT) *.o *.d
