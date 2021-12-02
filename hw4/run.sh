./nasm -f elf64 release.asm -o out/nasm.o
ld -lm -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2 ./out/nasm.o -o ./out/res
