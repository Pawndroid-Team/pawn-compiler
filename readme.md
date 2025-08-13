# Pawn Android Compiler

## What is this

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
In the native code (file `source/compiler/libpawnc.c`), replace the `com_pawndroid` package with your application's package:

```c
// REPLACE THIS LINE:
JNIEXPORT jint JNICALL Java_com_pawndroid_PawnCompiler_compilePawn(...)

// EXAMPLE
JNIEXPORT jint JNICALL Java_com_example_myapp_PawnCompiler_compilePawn(...)
```
Open `compile.sh` and change `NDK_PATH` to the location of the unpacked Android NDK.
Now you can compile the source code:
```bash
./compile.sh
```

## Implementation in the application
Create a file `PawnCompiler.java` with the following content:
```java
package com.example.myapp;

public class PawnCompiler {
	static {
		System.loadLibrary("pawnc");
	}

	public static native int compilePawn(String[] compilerArgs, String logFile);
	public static native int compilePawn(String[] compilerArgs);
}
```

*Don't forget to change the package name to your own!*