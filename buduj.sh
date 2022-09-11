#!/bin/bash

clear

ccache -M 70G
export CCACHE_EXEC=/usr/bin/ccache
export USE_CCACHE=1
export CCACHE_DIR=~/.build_cache
export OUT_DIR=home/jas7o/builds_out/exynos9820_jas7o

make O=out ARCH=arm64 exynos9820-beyond2lte-jas7o_defconfig

PATH="/home/jas7o/build_tools/toolchains/clang/host/linux-x86/clang-r416183b/bin:/home/jas7o/build_tools/toolchains/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:${PATH}" \

make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
echo ""
echo ""
#echo "Remove old kernel from build_out"
#rm /home/jas7o/kernel_build/build_out/boot/split_img/boot.img-kernel
echo ""
#echo "Copy new one..."
#cp out/arch/arm64/boot/Image /home/jas7o/kernel_build/build_out/boot/split_img/boot.img-kernel
echo "done."
