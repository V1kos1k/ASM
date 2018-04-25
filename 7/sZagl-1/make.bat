@echo off

masm /zi l6.asm,,;
masm /zi vvod.asm,,;
masm /zi as2.asm,,;
masm /zi as2s.asm,,;
masm /zi as10.asm,,;
masm /zi as10s.asm,,;
masm /zi as16.asm,,;
masm /zi as16s.asm,,;
masm /zi menu.asm,,;
link /co l6.obj vvod.obj menu.obj as2.obj as2s.obj as10.obj as10s.obj as16.obj as16s.obj,,,;

clean.bat

