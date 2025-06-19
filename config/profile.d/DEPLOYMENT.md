# Environment Setup Script Deployment Guide

## 概述

本指南说明如何将优化后的环境配置脚本 `setup_env.sh` 部署到系统级别。

## 脚本优化内容

与原始 `config/.shrc` 相比，新的 `setup_env.sh` 具有以下改进：

### 1. 结构化改进
- **函数化设计**: 将重复的逻辑封装为可重用函数
- **模块化配置**: 使用 case 语句清晰地区分不同架构的配置
- **错误处理**: 添加了路径存在性检查和命令可用性检查

### 2. 安全性增强
- **路径去重**: 防止重复添加相同的路径到环境变量
- **目录检查**: 只有当目录存在时才设置相关环境变量
- **优雅降级**: 当某些组件不可用时，脚本仍能正常工作

### 3. 维护性提升
- **清晰注释**: 添加了详细的文档说明
- **统一风格**: 使用一致的编码风格和命名约定
- **调试友好**: 添加了状态输出信息

## 部署步骤

### 1. 复制脚本到系统目录

```bash
# 使用 sudo 权限将脚本复制到系统目录
sudo cp setup_env.sh /etc/profile.d/

# 设置适当的权限
sudo chmod 644 /etc/profile.d/setup_env.sh
sudo chown root:root /etc/profile.d/setup_env.sh
```

### 2. 验证部署

```bash
# 检查文件是否存在且权限正确
ls -la /etc/profile.d/setup_env.sh

# 测试脚本语法
sudo bash -n /etc/profile.d/setup_env.sh
```

### 3. 测试环境配置

```bash
# 启动新的 shell 会话测试
bash -l

# 或者重新登录系统
# 检查环境变量是否正确设置
echo $PATH
echo $LD_LIBRARY_PATH
echo $LMUData
echo $PIP_CACHE_DIR
```

## 脚本功能说明

### 架构检测
- 自动检测 x86_64 和 ARM/AArch64 架构
- 为每种架构提供特定的环境配置

### Python 版本管理
- 智能检测 Python 版本
- 为 Python 3.8 和 3.10 提供专门的配置
- 对未知版本提供基本配置

### 路径管理
- 安全地添加路径到 PATH 和 LD_LIBRARY_PATH
- 避免重复路径
- 清理空的路径条目

### 环境变量设置
- **数据集路径**: LMUData, COMPASS_DATA_CACHE
- **缓存配置**: PIP_CACHE_DIR
- **库路径**: CUTLASS_PATH (仅 x86_64)
- **系统路径**: 各种二进制文件和库文件路径

### 别名定义
- **监控工具**: `wnv` (nvidia-smi 或 npu-smi)
- **pip 镜像**: `pipq` (清华源), `pipa` (阿里源)
- **脚本运行器**: `run` (shell_runner.sh)

## 注意事项

### 1. 权限要求
- 需要 sudo 权限来复制文件到 `/etc/profile.d/`
- 确保文件权限设置正确 (644)

### 2. 兼容性
- 脚本设计为向后兼容
- 支持多种 Python 版本和架构
- 对不存在的路径和文件进行优雅处理

### 3. 调试
- 脚本会输出配置信息以便调试
- 如果遇到问题，可以手动运行脚本查看输出

### 4. 维护
- 定期检查路径是否仍然有效
- 根据系统变化更新路径配置
- 监控脚本的执行时间，避免登录变慢

## 回滚方案

如果需要恢复到原始配置：

```bash
# 备份当前脚本
sudo cp /etc/profile.d/setup_env.sh /etc/profile.d/setup_env.sh.backup

# 删除系统级别的配置
sudo rm /etc/profile.d/setup_env.sh

# 恢复使用原始的 .shrc 文件
# 在用户的 .bashrc 或 .profile 中添加：
# source /path/to/config/.shrc
```

## 性能考虑

- 脚本经过优化，减少了不必要的命令执行
- 使用条件检查避免设置无效路径
- 函数化设计提高了代码重用性和执行效率

## 支持的系统

- **x86_64**: Ubuntu, CentOS, RHEL 等标准 Linux 发行版
- **ARM/AArch64**: 支持华为昇腾平台和其他 ARM 服务器
- **通用**: 对未知架构提供基本支持 