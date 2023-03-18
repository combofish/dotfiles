#!/bin/env python
import argparse
# from icecream import ic
from pathlib import Path
import os
import sys

base_path = Path(r'/home/larry/emacs_versions')
dest_path = Path(r'/home/larry/.emacs.d')


def config():
    parser = argparse.ArgumentParser()
    parser.add_argument('-l', '--list', action='store_true', help='list all Emacs config files.')
    parser.add_argument('-s', '--select_idx', type=int, default=-1, help='Select Emacs config files with idx.')
    parser.add_argument('--name', type=str, default='emacs-combofish', help='Emacs config files name.')
    return parser.parse_args()


def show(dirs):
    for i, v in enumerate(dirs):
        prefix = '*' if v.stat() == dest_path.stat() else ' '
        prefix = f"\033[0;31m{prefix}\033[0m"
        print(" [{}]".format(i), v.name, prefix)


def main(opt):
    # ic(opt.list)
    # ic(opt.select_idx)
    # ic(opt.name)
    dirs = [base_path / d for d in os.listdir(base_path)]

    if (opt.list):
        show(dirs)
        sys.exit(0)

    if (opt.select_idx != -1):
        if not opt.select_idx < len(dirs):
            raise IndexError("Valid select_idx, must in [0, {}]".format(len(dirs) - 1))

        source_path = dirs[opt.select_idx]
        # ic(source_path)
        if dest_path.exists():
            print("Unlink `{}`".format(dest_path))
            os.unlink(dest_path)

        print("Creating symlink `{}` to `{}`".format(source_path, dest_path))
        os.symlink(source_path, dest_path)

        sys.exit(0)


if __name__ == '__main__':
    main(config())
