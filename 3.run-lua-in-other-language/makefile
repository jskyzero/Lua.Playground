ROOT_DIR = .
SRC_DIR = $(ROOT_DIR)/src
LIB_DIR = $(ROOT_DIR)/lib
INC_DIR = $(ROOT_DIR)/include
OBJ_DIR = $(ROOT_DIR)/build
BIN_DIR = $(ROOT_DIR)/bin
TEST_DIR = $(ROOT_DIR)/test


CC = g++
FLAGS = -std=c++11 -O3 \
	-I $(ROOT_DIR) \
	-I $(INC_DIR) \


$(shell mkdir -p $(BIN_DIR) $(OBJ_DIR))

$(BIN_DIR)/main.out : $(SRC_DIR)/main.cpp $(LIB_DIR)/liblua.a
	$(CC) $(FLAGS) $^ -o $@

# $(OBJ_DIR)/version.1.s : $(SRC_DIR)/version.cpp
# 	$(CC) $(FLAGS) $^ -S -o $@

all: $(BIN_DIR)/main.out
	# make all finished

run: all
	./$(BIN_DIR)/main.out

test: run

clean:
	-rm -rf $(BIN_DIR)
	-rm -rf $(OBJ_DIR)