#!/bin/sh

APP=../build-st_pattern-Desktop_Qt_5_4_1_clang_64bit-Release/st_pattern.app/Contents/MacOS/st_pattern

INTER_FILE_NAME=test

SEG_DATA="../test_files/gen/diff_s"
SEG_SUFFIX=.txt
SEG_STEP=1.3
SEG_USE_SED=1
SEG_MIN_LEN=0.5

CLU_WEIGHT="0.001:0.001:0.001:0.001:0:0"
CLU_THRESH=0.4
CLU_MEM_LIM=100

MINE_RADIUS=150.0
MINE_MIN_SUP=3
MINE_MIN_PAT_LEN=3


$APP seg $SEG_DATA $SEG_SUFFIX $INTER_FILE_NAME $SEG_STEP $SEG_USE_SED $SEG_MIN_LEN

$APP cluster $INTER_FILE_NAME $CLU_WEIGHT $INTER_FILE_NAME $CLU_THRESH $CLU_MEM_LIM

$APP mine $INTER_FILE_NAME $INTER_FILE_NAME $INTER_FILE_NAME $MINE_RADIUS $MINE_MIN_SUP $MINE_MIN_PAT_LEN

rm *.cluster
rm *.s2c
rm *.seg
rm *.stp
rm *.tinc
rm *.tins