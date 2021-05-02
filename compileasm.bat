nasm -f bin btload.asm -o btload.bin

nasm -f elf64  ExtendedProgram.asm -o ExtendedProgram.o

wsl $WSLENV/x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "kernel.o"

wsl $WSLENV/x86_64-elf-ld -o kernel.tmp -Ttext 0x7e00 ExtendedProgram.o kernel.o

wsl $WSLENV/x86_64-elf-objcopy -O binary kernel.tmp kernel.bin

copy /b btload.bin+kernel.bin btload.bin

pause
