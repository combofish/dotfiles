#!/usr/bin/env python
import os
import os.path as osp
import shutil
import time


def link_config_files(src_file, dst_file):
    assert osp.exists(src_file), f"{src_file} does not exist."

    dst_file = osp.join(osp.expanduser('~'), dst_file)
    if osp.exists(dst_file):
        is_diff = os.system(f"cmp --quiet {src_file} {dst_file}")
        # print(is_diff)
        if is_diff == 0:
            print(f"{src_file} and {dst_file} are same. skip ...")
            return 0
        else:
            print(f"!!! {src_file} and {dst_file} are different.")
            print(f"{dst_file} exist, backup ...")
            # backup file
            timestamp = time.strftime('%Y%m%d_%H%M%S', time.localtime())
            new_dst_file = f"{dst_file}.{timestamp}"
            shutil.move(dst_file, new_dst_file)

    # dst_file does not exist or isn't same
    print(f"linking {src_file} to {dst_file}")
    os.link(src_file, dst_file)


if __name__ == '__main__':

    config_files = {
        "./config/.vimrc": ".vimrc",
        "./config/.shrc": ".shrc",
        "./config/.zshrc": ".zshrc",
        "./config/.condarc": ".condarc",
        "./config/.Xresources": ".Xresources"
    }

    for k, v in config_files.items():
        link_config_files(src_file=k, dst_file=v)
