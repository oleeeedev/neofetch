AS = nasm
ASFLAGS = -f elf64
LDFLAGS = -nostartfiles

build: asmfetch

clean:
	rm -f *.o asmfetch

asmfetch: fetch.o
	$(CC) $(LDFLAGS) -o $@ $< $(LOADLIBES) $(LDLIBS)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<
