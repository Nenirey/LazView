#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Linking /home/reinier/LazView/lazview
OFS=$IFS
IFS="
"
/usr/bin/ld -b elf64-x86-64 -m elf_x86_64  --dynamic-linker=/lib64/ld-linux-x86-64.so.2  --gc-sections -s -L. -o /home/reinier/LazView/lazview /home/reinier/LazView/link.res
if [ $? != 0 ]; then DoExitLink /home/reinier/LazView/lazview; fi
IFS=$OFS
