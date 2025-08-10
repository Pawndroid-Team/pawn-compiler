# Pawn Android Compiler

## What

This is a patched version of the Pawn 3.10.10 compiler which adds support for Android applications.

## Building from Source
### On Linux
Use your distribution's package manager to install the required dependencies. For example, in Ubuntu you would do:
```bash
sudo apt install gcc gcc-multilib make cmake
```
Download Android NDK from the [official website](https://developer.android.com/ndk) and unzip it.
Clone the repository:
```bash
git clone https://github.com/Pawndroid-Team/pawn-compiler.git ~/pawn
cd ~/pawn
```
Open compile.sh and change NDK_PATH to the location of the unpacked Android NDK.
Now you can compile the source code:
```bash
./compile.sh
```