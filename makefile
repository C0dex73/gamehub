#CONSTANTES

CC = g++
EXEC = gamehub
CFLAGS = -Wall -W
SRCEXTENSION = cpp
BINEXTENSION = o
HEADEREXTENSION = hh
BUILD_DIR = ./build
BIN_DIR = ./bin
INCLUDE_DIR = ./include
SRC_DIR = ./src
#TODO : add a debug feature

SRC = $(wildcard $(SRC_DIR)/*$(SRCEXTENSION))
OBJ = $(wildcard $(BIN_DIR)/*$(BINEXTENSION))
HEADERS = $(wildcard $(INCLUDE_DIR)/*$(HEADEREXTENSION))

#%.$(BINEXTENSION): %.$(SRCEXTENSION)
#	$(CC) -$(BINEXTENSION) @$ -cpp $> 

all: $(EXEC) $(OBJ)

$(BUILD_DIR)/$(EXEC): $(OBJ)
	$(CC) $(EXEC) -$(BINEXTENSION) $@ $^


$(OBJ): $(SRC) $(HEADERS)
	$(CC) -$(SRCEXTENSION) $(SRC) -$(BINEXTENSION)

build: $(OBJ) $(SRC) #TODO : to fix : not considering build rule while using it
	$(CC) $(EXEC) -$(BINEXTENSION) $(BIN_DIR)/$(EXEC)

.PHONY: echo_src echo_obj clean

echo_src: 
	@echo $(SRC)

echo_obj:
	@echo $(OBJ)

clear:
	$(foreach file, $(OBJ), rm -f $(OBJ))
	rm -f $(BIN_DIR)/$(EXEC)
	rm -f $(BIN_DIR)/$(EXEC)