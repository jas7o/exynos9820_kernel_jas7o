#!/bin/bash
                      
#rm -rf out
export ARCH=arm64
export SUBARCH=arm64
#export DTC_EXT=dtc


#make O=out ARCH=arm64 exynos9820-beyond2lte_defconfig

make O=out ARCH=arm64 exynos9820-beyond2lte-jas7o_defconfig

PATH="/home/jas7o/kernel_build/exynos9820_beyond2lte_kernel_jas7o/toolchain/clang/host/linux-x86/clang-r416183b/bin:/home/jas7o/kernel_build/exynos9820_beyond2lte_kernel_jas7o/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
echo ""
echo ""
echo "Remove old kernel from build_out"
rm /home/jas7o/kernel_build/build_out/boot/split_img/boot.img-kernel
echo ""
echo "Copy new one..."
cp out/arch/arm64/boot/Image /home/jas7o/kernel_build/build_out/boot/split_img/boot.img-kernel
echo "done."
