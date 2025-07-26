@echo off
REM call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

curl -L -O "https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-win64.zip"
curl -L -O "https://github.com/neovide/neovide/releases/download/0.14.1/neovide.exe.zip"
curl -L -o w64devkit.exe "https://github.com/skeeto/w64devkit/releases/download/v2.1.0/w64devkit-x64-2.1.0.exe"

w64devkit.exe

tar -xf nvim-win64.zip
move neovide.exe.zip nvim-win64\bin\
pushd nvim-win64\bin\
tar -xf neovide.exe.zip
neovide.exe
popd
