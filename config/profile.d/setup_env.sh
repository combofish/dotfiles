#!/bin/bash

###############################################################################
# System Environment Setup Script
# File: /etc/profile.d/setup_env.sh
# Purpose: Configure system-wide environment variables and paths
# Author: System Administrator
# Last Modified: $(date +%Y-%m-%d)
###############################################################################
# set -xe

# Function to check Python version
get_python_version() {
    local python_cmd="${1:-python3}"
    if command -v "$python_cmd" >/dev/null 2>&1; then
        "$python_cmd" --version 2>&1 | awk '{print $2}' | cut -d. -f1,2
    else
        echo "0.0"
    fi
}

# Function to check if Python version matches
is_python_version() {
    local target_version="$1"
    local current_version
    current_version=$(get_python_version)

    if [[ "$current_version" == "$target_version" ]]; then
        return 0
    else
        return 1
    fi
}

# Function to safely add to PATH
add_to_path() {
    local new_path="$1"
    if [[ -d "$new_path" ]] && [[ ":$PATH:" != *":$new_path:"* ]]; then
        export PATH="$new_path:$PATH"
    fi
}

# Function to safely add to LD_LIBRARY_PATH
add_to_ld_library_path() {
    local new_path="$1"
    if [[ -d "$new_path" ]] && [[ ":$LD_LIBRARY_PATH:" != *":$new_path:"* ]]; then
        export LD_LIBRARY_PATH="$new_path:${LD_LIBRARY_PATH:-}"
    fi
}

# Detect system architecture
ARCH=$(uname -m)

# Get Python version information for display
PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}' 2>/dev/null || echo "unknown")

# Common environment variables
export CUSTOM_VAR="System Environment Configuration"

# Architecture-specific configurations
case "$ARCH" in
"x86_64")
    # echo "Configuring environment for x86_64 architecture..."

    # CUTLASS library path
    if [[ -d "/home/kas/kas_workspace/zhaoliming/GitProjects/cutlass-main" ]]; then
        export CUTLASS_PATH="/home/kas/kas_workspace/zhaoliming/GitProjects/cutlass-main"
    fi

    # User binary paths
    add_to_path "/home/kas/user_bin"
    add_to_path "/home/kas/GitProjects/scripts/bin"

    # Dataset paths
    if [[ -d "/home/kas/downloads/dataset/LMUData" ]]; then
        export LMUData="/home/kas/downloads/dataset/LMUData"
    fi

    # Pip cache configuration
    if [[ -d "/home/kas/downloads" ]]; then
        export PIP_CACHE_DIR="/home/kas/downloads/pip_cache"
        mkdir -p "$PIP_CACHE_DIR"
    fi

    # OpenCompass dataset path
    if [[ -d "/home/kas/downloads/dataset/OpenCompassData-core-20240207" ]]; then
        export COMPASS_DATA_CACHE="/home/kas/downloads/dataset/OpenCompassData-core-20240207"
    fi

    # CUDA library paths
    add_to_ld_library_path "/usr/local/cuda/lib64"
    add_to_ld_library_path "/usr/lib/x86_64-linux-gnu"
    add_to_ld_library_path "/usr/local/nvidia/lib"

    # Aliases for x86_64
    alias wnv="watch -d -n 1 nvidia-smi"
    alias pipq="pip -i https://pypi.tuna.tsinghua.edu.cn/simple"
    alias pipa="pip -i https://mirrors.aliyun.com/pypi/simple"

    ;;

"aarch64" | arm*)
    # echo "Configuring environment for ARM/AArch64 architecture..."

    # Get Python version
    PYTHON_VERSION=$(get_python_version)
    # echo "Detected Python version: $PYTHON_VERSION"

    # Common paths for ARM architecture
    add_to_path "/home/kas/kas_workspace/zhaoliming/GitProjects/scripts/bin"

    # Dataset paths (ARM-specific locations)
    if [[ -d "/home/kas/kas_workspace/zhaoliming/downloads/dataset/LMUData" ]]; then
        export LMUData="/home/kas/kas_workspace/zhaoliming/downloads/dataset/LMUData"
    fi

    # Pip cache configuration (ARM-specific location)
    if [[ -d "/home/kas/kas_workspace/zhaoliming/downloads" ]]; then
        export PIP_CACHE_DIR="/home/kas/kas_workspace/zhaoliming/downloads/pip_cache"
        mkdir -p "$PIP_CACHE_DIR"
    fi

    # OpenCompass dataset path (ARM-specific location)
    if [[ -d "/home/kas/kas_workspace/zhaoliming/downloads/dataset/OpenCompassData-core-20240207" ]]; then
        export COMPASS_DATA_CACHE="/home/kas/kas_workspace/zhaoliming/downloads/dataset/OpenCompassData-core-20240207"
    fi

    # Python version-specific configurations
    if is_python_version "3.8"; then
        echo "当前 Python 版本是 3.8"

        # Python 3.8 specific paths (using exact paths from .shrc)
        export PATH="/opt/_internal/cpython-3.7.0/bin:/opt/conda/bin:/usr/local/python3.8.18/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/Ascend/ascend-toolkit/latest/fwkacllib/ccec_compiler/bin/:/usr/local/Ascend/ascend-toolkit/latest/toolkit/tools/ide_daemon/bin/:/usr/local/Ascend/ascend-toolkit/latest/tools/hccl_test/bin/:/usr/local/mpich/bin:/usr/local/Ascend/ascend-toolkit/latest/tools/hccl_test/bin"
        export LD_LIBRARY_PATH="/opt/_internal/cpython-3.7.0/lib:/usr/local/Ascend/ascend-toolkit/latest/fwkacllib/lib64/:/usr/local/python3.8.18/lib/python3.8/site-packages/torch/lib:/usr/local/Ascend/driver/lib64/:/usr/local/Ascend/driver/lib64/common/:/usr/local/Ascend/driver/lib64/driver/:/usr/local/Ascend/add-ons/:/usr/lib/aarch64_64-linux-gnu:/usr/local/python3.8.18/lib::/usr/local/mpich/lib:/usr/local/Ascend/ascend-toolkit/latest/lib64:/usr/local/Ascend/ascend-toolkit/latest/fwkacllib/lib64:/usr/local/Ascend/ascend-toolkit/latest/aarch64-linux/devlib/"

        # Source Ascend environment scripts
        [[ -f "/usr/local/Ascend/ascend-toolkit/set_env.sh" ]] && source "/usr/local/Ascend/ascend-toolkit/set_env.sh"
        [[ -f "/usr/local/Ascend/nnal/atb/set_env.sh" ]] && source "/usr/local/Ascend/nnal/atb/set_env.sh"

    elif is_python_version "3.10"; then
        # echo "当前 Python 版本是 3.10"

        # Python 3.10 specific paths (using exact paths from .shrc)
        export PATH="/opt/_internal/cpython-3.7.0/bin:/opt/conda/bin:/usr/local/python3.10/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        export LD_LIBRARY_PATH="/opt/_internal/cpython-3.7.0/lib:/usr/local/Ascend/driver/lib64/common:/usr/local/Ascend/driver/lib64/driver:"

        # Additional path updates
        export PATH="/usr/local/python3.10/bin:${PATH}"
        export LD_LIBRARY_PATH="/usr/local/Ascend/driver/lib64/common:/usr/local/Ascend/driver/lib64/driver:${LD_LIBRARY_PATH}"

        # Source Ascend environment scripts
        [[ -f "/usr/local/Ascend/ascend-toolkit/set_env.sh" ]] && source "/usr/local/Ascend/ascend-toolkit/set_env.sh"
        [[ -f "/usr/local/Ascend/nnal/atb/8.0.0/atb/set_env.sh" ]] && source "/usr/local/Ascend/nnal/atb/8.0.0/atb/set_env.sh"
        [[ -f "/usr/local/Ascend/mindie/set_env.sh" ]] && bash "/usr/local/Ascend/mindie/set_env.sh"
        [[ -f "/usr/local/Ascend/atb-models/set_env.sh" ]] && source "/usr/local/Ascend/atb-models/set_env.sh"
        [[ -f "usr/local/Ascend/mindie/latest/mindie-llm/set_env.sh" ]] && source "/usr/local/Ascend/mindie/latest/mindie-llm/set_env.sh"

    elif is_python_version "3.11"; then

        export PATH="${PATH}:/usr/local/Ascend/mindie/2.0.RC2/mindie-llm/bin"
        export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/Ascend/mindie/2.0.RC2/mindie-llm/lib"

        # Source Ascend environment scripts
        [[ -f "/usr/local/Ascend/ascend-toolkit/set_env.sh" ]] && source "/usr/local/Ascend/ascend-toolkit/set_env.sh"
        # [[ -f "/usr/local/Ascend/nnal/atb/8.0.0/atb/set_env.sh" ]] && source "/usr/local/Ascend/nnal/atb/8.0.0/atb/set_env.sh"
        [[ -f "/usr/local/Ascend/nnal/atb/set_env.sh" ]] && source "/usr/local/Ascend/nnal/atb/set_env.sh"
        [[ -f "/usr/local/Ascend/mindie/set_env.sh" ]] && bash "/usr/local/Ascend/mindie/set_env.sh"
        [[ -f "/usr/local/Ascend/atb-models/set_env.sh" ]] && source "/usr/local/Ascend/atb-models/set_env.sh"
        [[ -f "usr/local/Ascend/mindie/latest/mindie-llm/set_env.sh" ]] && source "/usr/local/Ascend/mindie/latest/mindie-llm/set_env.sh"

        echo "当前 Python 版本是 3.11"
        echo PATH=$PATH
        echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH

    else
        echo "当前 Python 版本不是 3.8 也不是 3.10，而是 $PYTHON_VERSION"

        # Basic ARM configuration
        add_to_ld_library_path "/usr/local/Ascend/driver/lib64/common"
        add_to_ld_library_path "/usr/local/Ascend/driver/lib64/driver"
    fi

    # Aliases for ARM
    alias wnv="watch -d -n 1 npu-smi info"
    alias pipq="pip -i https://pypi.tuna.tsinghua.edu.cn/simple"
    alias pipa="pip -i https://mirrors.aliyun.com/pypi/simple"

    ;;

*)
    echo "Warning: Unknown architecture: $ARCH"
    echo "Applying minimal configuration..."
    ;;
esac

# 如果存在目录
if [ -d "/home/kas/kas_workspace/zhaoliming/downloads/data_juice_cache" ]; then
    # 缓存主目录
    export DATA_JUICER_CACHE_HOME="/home/kas/kas_workspace/zhaoliming/downloads/data_juice_cache"
    # 模型缓存目录
    export DATA_JUICER_MODELS_CACHE="/home/kas/kas_workspace/zhaoliming/downloads/data_juice_cache/models"
    # 资源缓存目录
    export DATA_JUICER_ASSETS_CACHE="/home/kas/kas_workspace/zhaoliming/downloads/data_juice_cache/assets"
fi

if [ -d "/home/kas/kas_workspace/zhaoliming/GitProjects/scripts/bin" ]; then
    export PATH="/home/kas/kas_workspace/zhaoliming/GitProjects/scripts/bin:${PATH}"
fi

# Common aliases (available for all architectures)
if [[ -f "/home/kas/kas_workspace/zhaoliming/GitProjects/scripts/bin/shell_runner.sh" ]]; then
    alias run="/home/kas/kas_workspace/zhaoliming/GitProjects/scripts/bin/shell_runner.sh"
elif [[ -f "/home/kas/GitProjects/scripts/bin/shell_runner.sh" ]]; then
    alias run="/home/kas/GitProjects/scripts/bin/shell_runner.sh"
fi

# 如果存在目录 /usr/local/nginx/ , 添加到 PATH 中
if [ -d "/usr/local/nginx" ]; then
    export PATH="/usr/local/nginx/sbin:${PATH}"
fi

# 如果存在目录 /home/kas/kas_workspace/zhaoliming/GitProjects/project_2025_npu/proj_0519_try_frp/frp_0.62.1_linux_arm64 , 添加到 PATH 中
if [ -d "/home/kas/kas_workspace/zhaoliming/GitProjects/project_2025_npu/proj_0519_try_frp/frp_0.62.1_linux_arm64" ]; then
    export PATH="/home/kas/kas_workspace/zhaoliming/GitProjects/project_2025_npu/proj_0519_try_frp/frp_0.62.1_linux_arm64:${PATH}"
fi

# # /root/.local/bin is a common path for user-specific scripts
if [ -d "/root/.local/bin" ]; then
    export PATH="${PATH}:/root/.local/bin"
fi

alias larry_home="cd /home/kas/kas_workspace/zhaoliming"
alias larry_git="cd /home/kas/kas_workspace/zhaoliming/GitProjects"
alias larry_download="cd /home/kas/kas_workspace/zhaoliming/downloads"
alias larry_workspace="cd /home/kas/kas_workspace/zhaoliming"
alias larry_scripts="cd /home/kas/kas_workspace/zhaoliming/GitProjects/scripts"

alias load_env="source /etc/profile.d/setup_env.sh"

# Clean up LD_LIBRARY_PATH (remove empty entries)
if [[ -n "$LD_LIBRARY_PATH" ]]; then
    export LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed 's/::/:/g' | sed 's/^://' | sed 's/:$//')
fi

# echo "Environment setup completed for $ARCH architecture"
