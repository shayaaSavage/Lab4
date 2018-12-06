CC=gcc
CFLAGS=-I.
all : t1 t2 t3 t5
t1 : 
	$(CC) -o t1.o find_min_max.c utils.c parallel_min_max.c 
t2 : 
	$(CC) -o t2.o task2.c 
t3 : 
	$(CC) -o t3.o process_memory.c
t5 : 
	mkdir ./stat/
	$(CC) -nostartfiles -c ./sum.c -o ./sum.o
	ar rcs ./stat/libsum.a  ./sum.o
	$(CC) -c parallel_sum.c
	$(CC) find_min_max.c utils.c parallel_sum.c -Lstat -lsum  -lpthread -o t5.o
clear : 
	rm ./stat/libsum.a ./sum.o t1.o t2.o t3.o t5.o
	rmdir ./stat
