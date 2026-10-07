---
title: The Open Smalltalk VM
description: "The VM Cuis runs on, how to build it, and how to bundle it for every platform."
---

{% include toc.html %}

Cuis runs on the [Open Smalltalk](https://opensmalltalk.org) VM. The latest release of this VM is included in the `CuisVM.app` folder, for the following platforms: LinuxARM64, LinuxX64, MacOSARM, MacOSx64, Win64x64, Win64ARM.

If you want to use a newer, unreleased build of the OpenSmalltalk VM, you can grab it from [Open Smalltalk Builds](https://github.com/OpenSmalltalk/opensmalltalk-vm/actions). You can replace the included VM in the `CuisVM.app` folder, or you can store it elsewhere and adapt the `RunCuisOnLinux.sh`, `RunCuisOnMacTerminal.sh` or `RunCuisOnWindows.bat` scripts.

## Build your own VM

If you are comfortable using Linux tools (`gcc`, `make`, `ld`), you can build the OpenSmalltalk VM yourself.

This may be helpful to obtain a VM for a platform which is supported, but not part of the official release builds. For example, Linux on RiscV64.

The process is basically:

```sh
git clone --depth 1 https://github.com/OpenSmalltalk/opensmalltalk-vm
cd opensmalltalk-vm/building/linux64ARMv8  [ pick os+cpu ]
  [ read HowToBuild to get required libraries ]
cd squeak.cog.spur/build    [or squeak.stack.spur/build ]
./mvm
[ Answer `y` to "clean?" ]
```

- `stack`: bytecode interpreter.
- `cog`: JIT compiler (faster).

If you build a 64-bit VM, don't forget to use the 64-bit image: e.g. `Cuis-Smalltalk-Dev/Cuis6.0-5542.image`.

## How to create a Mac Unified VM

This procedure builds a Mac VM that includes both the Apple Silicon and Intel binaries and runs natively on both flavors of Mac hardware. This Mac Unified VM is the base of the MultiPlatform Cuis VM Bundle.

1. Build or download Mac VM builds from <https://github.com/OpenSmalltalk/opensmalltalk-vm/actions> or from <https://github.com/OpenSmalltalk/opensmalltalk-vm/releases>. Use `squeak.cog.spur_macos64x64.dmg` and `squeak.cog.spur_macos64ARMv8.dmg`.
2. Create folder `CuisVMBundle`. `cd` to it.
3. Create a folder named after the date of the VM builds, like `2026-04-20` (yes, you're likely to repeat all this in the future). `cd` to it.
4. Add [`unify.sh`](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/unify.sh) there.
5. Create subfolder `ARM`, containing ARM `Squeak.app` (Mount dmg. Drag `Squeak.app` to `ARM` folder).
6. Create subfolder `Intel`, containing Intel `Squeak.app` (Mount dmg. Drag `Squeak.app` to `Intel` folder).
7. Create folder `Unified`.
8. Run `./unify.sh`.

   If you get a message such as "You have not agreed to the Xcode and Apple SDKs license..." you may need to `sudo xcodebuild -license`, then "agree" or whatever Apple comes up with next.

Done. `Unified/Squeak.app` is our Unified VM. Its `Contents` folder is about 7.2 MB.

(Thanks Cristián Pérez for this recipe)

## How to build the `CuisVM.app` multiplatform VM bundle

This procedure bundles together the VMs for various platforms (MacOSx64, MacOSARM, Win64x64, Win64ARM, LinuxX64, LinuxARM64). The result is the VM we include with Cuis. It was tested on all these platforms.

1. Follow [How to create a Mac Unified VM](#how-to-create-a-mac-unified-vm). Download `squeak.cog.spur_linux64ARMv8.tar.gz`, `squeak.cog.spur_linux64x64.tar.gz`, `squeak.cog.spur_win64ARMv8.zip`, `squeak.cog.spur_win64x64.zip`.
2. Create subfolder `Multiplatform`.
3. Copy Mac unified VM there. Rename it as `CuisVM.app`. Show package contents.
4. Inside `Cuis.app/Contents` create folders `Windows-x86_64`, `Windows-arm64`, `Linux-x86_64` and `Linux-arm64`.
5. Fill them with the contents of the zip files for the VM for each platform.
6. In each of the Windows folders, do: `chmod +x *`

The result is a multiplatform `CuisVM.app`. Its `Contents` folder is about 32.5 MB.

## VM dump of Smalltalk processes

Launch the system in a terminal window (using the `RunCuisOn*` script).

Send `SIGUSR1` to the process (via `kill -USR1 pid`).

The VM will dump the stack traces of all processes to `stdout`.

(Thanks Eliot!)
