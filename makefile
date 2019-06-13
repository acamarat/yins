CC=gcc
CFLAGS=-g
CLIB=-lm

OBJ=pureins.bin
$(OBJ): main.o ins.o insio.o inscmn.o
	$(CC) main.o ins.o insio.o inscmn.o $(CFLAGS) $(CLIB) -o $(OBJ)

UT_OBJ=unittest.bin
ut: unittest.o ins.o insio.o inscmn.o
	$(CC) unittest.o ins.o insio.o inscmn.o $(CFLAGS) $(CLIB) -lcriterion -o $(UT_OBJ)
	./$(UT_OBJ)

unittest.o: unittest.c
main.o: main.c
ins.o: ins.c ins.h
insio.o: insio.c ins.h
inscmn.o: inscmn.c ins.h

clean:
	trash *.o $(OBJ) $(UT_OBJ)
test:
	./$(OBJ) > ./data/tmp_output.csv
