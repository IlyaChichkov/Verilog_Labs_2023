PROGRAM = hello
C_FILES := $(wildcard src/*.c)
OBJS := $(patsubst %.c, %.o, $(C_FILES))

run:$(PROGRAM)
	gdb ./$(PROGRAM)

%.o:%.c
	gcc -Iinc -c $< -o $@ -g

$(PROGRAM):$(OBJS)
	gcc -o $(PROGRAM) $(OBJS)

clean:
	rm -f $(OBJS) $(PROGRAM)