APP_NAME = SimpleComputer
LIB_NAME = libgame

#CFLAGS = -w
CFLAGS = -Wall -Werror
CPPFLAGS = -I src -MP -MMD
#CTEST = -I thirdparty

#GAME = obj/main.o obj/check_dice.o obj/moving.o obj/play.o obj/print_dice.o obj/random.o obj/restart.o obj/result.o obj/step_counter.o 
#TEST = obj/test_main.o obj/test.o obj/check_dice.o obj/result.o obj/moving.o obj/restart.o obj/random.o

BIN_DIR = bin
OBJ_DIR = obj
SRC_DIR = src

APP_PATH = $(BIN_DIR)/$(APP_NAME)
#TEST_PATH = $(BIN_DIR)/test.exe
#LIB_PATH = $(OBJ_DIR)/$(LIB_NAME).a

.PHONY: all
all: $(APP_PATH)
 
$(APP_PATH): obj/*.o
	gcc $(CFLAGS) $(CPPFLAGS) $^ -o $@

obj/*.o : src/*.c 
	gcc -c $(CFLAGS) $(CPPFLAGS) $< -o $@


.PHONY: clean
clean:
	rm -rf $(APP_PATH) $(OBJ_DIR)/*.o $(OBJ_DIR)/*.d
	
.PHONY: run
run: $(BIN_DIR)/./$(APP_NAME)
	$(BIN_DIR)/./$(APP_NAME)
	
#obj/%.o : src/libgame/%.c 
#	gcc -c $(CFLAGS) $(CPPFLAGS) $< -o $@

#.PHONY: test
#test: bin/test

#bin/test : $(TEST)
#	gcc $(CFLAGS) $(CPPFLAGS) $^ -o $@
	
#obj/%.o : test/%.c
#	gcc -c $(CFLAGS) $(CPPFLAGS) $(CTEST) $^ -o $@

	
#.PHONY: run_test
#run_test: bin/./test.exe
#	bin/./test.exe