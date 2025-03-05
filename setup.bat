@echo off
call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
tar -xf nvim-win64.zip
move neovide.exe.zip nvim-win64\bin\
pushd nvim-win64\bin\
tar -xf neovide.exe.zip
neovide.exe
popd
