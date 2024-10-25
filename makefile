#CONSTANTES

CC = g++
EXEC = gamehub
CFLAGS = -Wall
SRCEXTENSION = cpp
BINEXTENSION = o
BUILD_DIR = ./build
BIN_DIR = ./bin
INCLUDE_BIN = ./include
SRC_DIR = ./src

SRC = $(wildcard $(SRC_DIR)/*$(SRCEXTENSION))
OBJ = $(wildcard $(BIN_DIR)/*$(BINEXTENSION))

.PHONY: echo_src echo_obj

echo_src: 
	@echo $(SRC)

echo_obj:
	@echo $(OBJ)