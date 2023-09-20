GEN_DIR = gen
BUILD_DIR = build

all: directories string_calc

directories: 
	mkdir -p $(GEN_DIR)
	mkdir -p $(BUILD_DIR)

string_calc: $(GEN_DIR)/lex.yy.c $(GEN_DIR)/y.tab.c
	gcc $(GEN_DIR)/lex.yy.c $(GEN_DIR)/y.tab.c -o $(BUILD_DIR)/string_calc

$(GEN_DIR)/lex.yy.c: string_calc.l
	flex -o $(GEN_DIR)/lex.yy.c string_calc.l

$(GEN_DIR)/y.tab.c: string_calc.y
	bison -o $(GEN_DIR)/y.tab.c -dy string_calc.y

clean:
	rm -rf $(GEN_DIR)
	rm -f string_calc

