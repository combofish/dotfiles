#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: Combofish
# Filename: runsf.py
# Description：用于编译执行单个 CPP 文件程序， 不含命令行参数。

import os
import argparse
import sys

max_run_time = 5
time_prefix = f"timeout -s 9 {max_run_time}s"
CXX_prefix = "clang++ -std=c++17 -fsanitize=address -Wall -Werror -Wreturn-type -fno-omit-frame-pointer" # -Wc++17-extensions

C_prefix = "gcc"


def run_command(cmd, print_cmd=True):
    if print_cmd:
        print(cmd)

    ret = os.system(cmd)
    assert ret == 0, f"os.system with exit code: {ret}"


def main():
    """
    用于编译执行单个 CPP 文件程序， 不含命令行参数。
    """

    if len(sys.argv) == 1:
        print(f"{sys.argv[0]} filename")
        sys.exit(-1)

    filename = sys.argv[1]
    # print(filename)

    assert os.path.exists(filename), f"Make sure {filename} exists!"

    suffix = 'echo "no command add!"'

    if filename.endswith('.cpp'):
        output_file_name = 'main'
        suffix = f"{CXX_prefix}" \
                 f" -g {' '.join(sys.argv[1:])}" \
                 " -l fmt " \
                 f"-o {output_file_name} &&" \
                 f" {time_prefix} ./{output_file_name} &&" \
                 f" rm {output_file_name}"

    elif filename.endswith('.c'):
        output_file_name = 'main'
        suffix = f"{C_prefix}" \
                 f" -g {' '.join(sys.argv[1:])}" \
                 f" -o {output_file_name} &&" \
                 f" {time_prefix} ./{output_file_name} &&" \
                 f" rm {output_file_name}"

    elif filename.endswith('.tex'):
        suffix = f"pdflatex \\\\nonstopmode\\\\input {' '.join(sys.argv[1:])}"

    run_command(suffix)


if __name__ == '__main__':
    main()
