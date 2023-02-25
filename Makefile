SKYNET_ROOT ?= ../skynet
include $(SKYNET_ROOT)/platform.mk

PLAT ?= none

TARGET = ./ccd.so

CXX=g++

ifeq ($(PLAT), macosx)
	CXXFLAGS = -g -O2 -pedantic -bundle -undefined dynamic_lookup -std=c++17
else
ifeq ($(PLAT), linux)
	CXXFLAGS = -g -O2 -shared -fPIC -std=c++17
endif
endif

LUA_INC ?= $(SKYNET_ROOT)/3rd/lua/

SRC = ./

LIBCCD_INC ?= ./libccddbl/src
LIBCCD_SRC ?= ./libccddbl/src

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(foreach dir, $(SRC), $(wildcard $(dir)/*.cpp)) \
			$(foreach dir, $(LIBCCD_SRC), $(wildcard $(dir)/*.c))
			
	$(CXX) $(CXXFLAGS) -o $@ $^ -I$(LIBCCD_INC) -I$(LUA_INC)

clean:
	rm -f *.o $(TARGET) && \
	rm -rf *.dSYM