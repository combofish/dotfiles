#!/usr/bin/env python
'''
Author: larry combofish@163.com
Date: 2023-06-24 15:53:57
LastEditors: larry combofish@163.com
LastEditTime: 2023-12-21 11:12:04
FilePath: /dotfiles/startup.py
Description: 
'''

import argparse
import os
import subprocess
import sys
from pathlib import Path

work_dir = os.path.join(os.environ['HOME'], 'GitProjects/dotfiles')
scripts_dir = 'startup.conf.d/'
first_run_file_name = 'startup.sh'

# change work dir
os.chdir(work_dir)


def get_args_parser():
    parser = argparse.ArgumentParser(description="Config system.")

    parser.add_argument('-f', '--first_run', action='store_true',
                        help="If true, for the first running.")

    return parser.parse_args()


def main(config):
    dirs = os.path.join(work_dir, scripts_dir)

    for file in os.listdir(dirs):
        if file.endswith('.sh') or file.endswith('.py'):
            file_path = os.path.join(dirs, file)
            if os.access(file_path, os.X_OK):
                # print(file)
                prefix = 'inst'
                print(f"\033[0;31m{prefix}\033[0m - run - {Path(file_path).name}")
                subprocess.run(file_path, shell=True)
                

    print(f"config.first_run: {config.first_run}")
    if config.first_run:
        first_run_file = os.path.join(dirs, first_run_file_name)
        if os.path.exists(first_run_file):
            # print(first_run_file)
            ret = subprocess.run(f'sh {first_run_file}', shell=True)
            if ret.returncode == 0:
                print(ret.returncode)


if __name__ == '__main__':
    args = get_args_parser()
    main(args)
