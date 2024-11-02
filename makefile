#CONSTANTES

CC = g++
EXEC = gamehub
CFLAGS = Wall -W
SRCEXTENSION = cpp
BINEXTENSION = o
HEADEREXTENSION = hh
BUILD_DIR = ./build
BIN_DIR = ./bin
INCLUDE_DIR = ./include
SRC_DIR = ./src
#TODO : add a debug feature

SRC = $(wildcard $(SRC_DIR)/*$(SRCEXTENSION))
#OBJ = $(wildcard $(BIN_DIR)/*$(BINEXTENSION))
OBJ = $(patsubst $(SRC_DIR)/%.$(SRCEXTENSION), $(BIN_DIR)/%.$(BINEXTENSION), $(SRC))
HEADERS = $(wildcard $(INCLUDE_DIR)/*$(HEADEREXTENSION))

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BIN_DIR)/%.$(BINEXTENSION): $(SRC_DIR)/%.$(SRCEXTENSION)
	$(CC) -$(SRCEXTENSION) -c $< -$(BINEXTENSION) $@

$(BIN_DIR)/$(EXEC): $(OBJ)
	$(CC) -$(BINEXTENSION) $(BIN_DIR)/$(EXEC) $^

build: $(BIN_DIR)/$(EXEC)
	cp $< $(BUILD_DIR)/
.PHONY: echo_src echo_obj clean

echo_src: 
	@echo $(SRC_DIR)/%.$(SRCEXTENSION)

echo_obj:
	@echo $(OBJ)

clear:
	rm -f $(OBJ)
	rm -f $(BIN_DIR)/$(EXEC)