'''
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2024-11-06 08:48:50
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2024-11-06 08:58:11
FilePath: /dotfiles/bin/cf_download_model_from_ms.py
Description: 
'''
"""
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2024-11-06 08:45:19
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2024-11-06 08:46:01
FilePath: /dotfiles/bin/cf_download_model_from_hf.py
Description: 
"""

import argparse
import os
from modelscope import snapshot_download
# model_dir = snapshot_download('Qwen/Qwen2.5-32B-Instruct')

# local_dir = '/home/kas/kas_workspace/zhaoliming/data/downloads_from_ms_via_script'

# repo_id = 'BAAI/Aquila-VL-2B-llava-qwen'
# repo_id = 'google/siglip-so400m-patch14-384'






def download(repo_id, dst_path):
    # 假设 download 函数会从 repo_id 下载内容到 dst_path
    
    # 此处添加下载逻辑
    dst_path = os.path.join(dst_path, repo_id)

    os.makedirs(dst_path, exist_ok=True)

    # print(f"----Saving to {dst_path}.----")
    print(f"Downloading from repo_id: {repo_id} to dst_path: {dst_path}")

    # 指定仓库 ID 和下载目录
    model_dir = snapshot_download(
        model_id = repo_id,
        local_dir=dst_path
    )

    print(f'----Saving to {dst_path}.----')


def main():
    # 创建 ArgumentParser 对象
    parser = argparse.ArgumentParser(description="Download repository content.")

    # 添加 repo_id 参数（必填）
    parser.add_argument("repo_id", type=str, help="Repository ID to download from")

    # 添加 dst_path 参数（可选，带默认值）
    parser.add_argument(
        "--dst_path",
        type=str,
        default="/home/kas/kas_workspace/zhaoliming/model_ckpts/from_model_scope",
        help="Destination path for downloaded content",
    )

    # 解析命令行参数
    args = parser.parse_args()

    # 调用 download 函数
    download(args.repo_id, args.dst_path)


if __name__ == "__main__":
    main()
