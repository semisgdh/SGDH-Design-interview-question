#!/bin/bash

# 파일 존재 여부 확인
if [ ! -f "output.txt" ]; then
    echo "Error: File output.txt does not exist."
    exit 1
fi

if [ ! -f "answer.txt" ]; then
    echo "Error: File answer.txt does not exist."
    exit 1
fi

# 파일 비교
if diff -q "output.txt" "answer.txt" > /dev/null; then
    echo "[PASS] The files are the same."
else
    echo "[FAIL] The files are different."
fi
