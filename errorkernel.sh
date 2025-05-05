#!/bin/bash

# 将报错中涉及的 kernel_platform 中的 Android.bp 文件重命名为 .bak
FILES=(
"kernel_platform/bootable/bootloader/edk2/QcomModulePkg/Library/OpenDice/boringssl/Android.bp"
"kernel_platform/bootable/bootloader/edk2/QcomModulePkg/Library/OpenDice/boringssl/selftest/Android.bp"
"kernel_platform/bootable/bootloader/edk2/QcomModulePkg/Library/lz4/lib/Android.bp"
"kernel_platform/bootable/bootloader/edk2/QcomModulePkg/Library/lz4/programs/Android.bp"
"kernel_platform/external/dtc/Android.bp"
"kernel_platform/prebuilts/build-tools/Android.bp"
"kernel_platform/prebuilts/clang/host/linux-x86/soong/Android.bp"
"kernel_platform/prebuilts/clang/host/linux-x86/Android.bp"
"kernel_platform/tools/mkbootimg/Android.bp"
"kernel_platform/tools/mkbootimg/gki/Android.bp"
"kernel_platform/external/dtc/libfdt/Android.bp"

)

for f in "${FILES[@]}"; do
  if [ -f "$f" ]; then
    echo "Renaming $f to $f.bak"
    mv "$f" "$f.bak"
  fi
done

echo "Done. You can now rebuild."
