#!/usr/bin/env bash
#
# create-agent.sh — 交互式创建新智能体
#
# 用法: ./scripts/create-agent.sh
#
# 引导用户填写名称、描述、部门、核心使命，自动生成 .md 文件

set -euo pipefail

# --- 颜色 ---
if [[ -t 1 ]]; then
  C_GREEN=$'\033[0;32m'; C_YELLOW=$'\033[1;33m'; C_RED=$'\033[0;31m'
  C_CYAN=$'\033[0;36m'; C_BOLD=$'\033[1m'; C_DIM=$'\033[2m'; C_RESET=$'\033[0m'
else
  C_GREEN=''; C_YELLOW=''; C_RED=''; C_CYAN=''; C_BOLD=''; C_DIM=''; C_RESET=''
fi

ok()     { printf "${C_GREEN}[OK]${C_RESET}  %s\n" "$*"; }
warn()   { printf "${C_YELLOW}[!!]${C_RESET}  %s\n" "$*"; }
err()    { printf "${C_RED}[ERR]${C_RESET} %s\n" "$*" >&2; }
header() { printf "\n${C_BOLD}%s${C_RESET}\n" "$*"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# 部门列表（目录名 → 显示名）
declare -A DEPT_MAP=(
  [academic]="学术部"
  [design]="设计部"
  [engineering]="工程部"
  [finance]="金融部"
  [game-development]="游戏开发部"
  [hr]="人力资源部"
  [legal]="法务部"
  [marketing]="营销部"
  [paid-media]="付费媒体部"
  [product]="产品部"
  [project-management]="项目管理部"
  [sales]="销售部"
  [spatial-computing]="空间计算部"
  [specialized]="专项部"
  [supply-chain]="供应链部"
  [testing]="测试部"
  [support]="支持部"
)

# 可选颜色
COLORS=(blue cyan green orange pink purple red yellow)

header "创建新智能体"
echo ""

# --- 检测终端 ---
if [[ ! -t 0 ]]; then
  err "此脚本需要交互式终端。请直接运行: ./scripts/create-agent.sh"
  exit 1
fi

# --- 1. 输入名称 ---
read -r -p "$(printf "${C_BOLD}智能体名称${C_RESET}（中文，如"安全审计师"）: ")" AGENT_NAME </dev/tty
if [[ -z "$AGENT_NAME" ]]; then
  err "名称不能为空。"
  exit 1
fi

# --- 2. 输入描述 ---
read -r -p "$(printf "${C_BOLD}一句话描述${C_RESET}（如"专注代码安全审计的专家"）: ")" AGENT_DESC </dev/tty
if [[ -z "$AGENT_DESC" ]]; then
  err "描述不能为空。"
  exit 1
fi

# --- 3. 选择部门 ---
echo ""
printf "${C_BOLD}选择部门${C_RESET}：\n"
dept_keys=()
i=1
for key in academic design engineering finance game-development hr legal marketing paid-media product project-management sales spatial-computing specialized supply-chain testing support; do
  dept_keys+=("$key")
  printf "  ${C_GREEN}%2d${C_RESET} %s（%s）\n" "$i" "${DEPT_MAP[$key]}" "$key"
  i=$((i + 1))
done
echo ""
read -r -p "$(printf "选择 [1-${#dept_keys[@]}]: ")" dept_choice </dev/tty

if ! [[ "$dept_choice" =~ ^[0-9]+$ ]] || [[ "$dept_choice" -lt 1 ]] || [[ "$dept_choice" -gt ${#dept_keys[@]} ]]; then
  err "无效选择。"
  exit 1
fi

DEPT_KEY="${dept_keys[$((dept_choice - 1))]}"
DEPT_NAME="${DEPT_MAP[$DEPT_KEY]}"

# --- 4. 选择颜色 ---
echo ""
printf "${C_BOLD}选择颜色${C_RESET}：\n"
for i in "${!COLORS[@]}"; do
  printf "  ${C_GREEN}%d${C_RESET} %s\n" "$((i + 1))" "${COLORS[$i]}"
done
echo ""
read -r -p "$(printf "选择 [1-${#COLORS[@]}]（默认 cyan）: ")" color_choice </dev/tty

if [[ -z "$color_choice" ]]; then
  AGENT_COLOR="cyan"
elif [[ "$color_choice" =~ ^[0-9]+$ ]] && [[ "$color_choice" -ge 1 ]] && [[ "$color_choice" -le ${#COLORS[@]} ]]; then
  AGENT_COLOR="${COLORS[$((color_choice - 1))]}"
else
  AGENT_COLOR="cyan"
fi

# --- 5. 输入核心使命（多行） ---
echo ""
printf "${C_BOLD}核心使命${C_RESET}（每行一个要点，空行结束）：\n"
MISSION_LINES=()
while true; do
  read -r -p "  > " line </dev/tty
  [[ -z "$line" ]] && break
  MISSION_LINES+=("$line")
done

if [[ ${#MISSION_LINES[@]} -eq 0 ]]; then
  MISSION_LINES+=("核心专业领域待定义")
fi

# --- 6. 生成文件名 ---
# 格式: {部门}-{名称拼音或英文}.md
# 简化处理：用部门前缀 + 用户自定义后缀
echo ""
read -r -p "$(printf "${C_BOLD}文件名后缀${C_RESET}（英文，如 security-auditor，将生成 ${DEPT_KEY}/[后缀].md）: ")" FILE_SUFFIX </dev/tty
if [[ -z "$FILE_SUFFIX" ]]; then
  # 自动生成：取名称的简单处理
  FILE_SUFFIX=$(echo "$AGENT_NAME" | sed 's/ /-/g' | tr '[:upper:]' '[:lower:]')
  warn "使用自动生成的后缀: $FILE_SUFFIX"
fi

AGENT_FILE="$REPO_ROOT/$DEPT_KEY/${DEPT_KEY}-${FILE_SUFFIX}.md"

if [[ -f "$AGENT_FILE" ]]; then
  err "文件已存在: $AGENT_FILE"
  read -r -p "$(printf "覆盖？[y/N]: ")" confirm </dev/tty
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "已取消。"
    exit 0
  fi
fi

# --- 7. 生成文件内容 ---
MISSION_BLOCK=""
for line in "${MISSION_LINES[@]}"; do
  MISSION_BLOCK+="- ${line}
"
done

cat > "$AGENT_FILE" << EOF
---
name: ${AGENT_NAME}
description: ${AGENT_DESC}
color: ${AGENT_COLOR}
---

# ${AGENT_NAME}

你是**${AGENT_NAME}**，${AGENT_DESC}

## 你的身份与记忆

- **角色**：${AGENT_NAME}
- **个性**：专业、务实、注重结果
- **记忆**：你记住行业最佳实践、常见陷阱和解决方案
- **经验**：你在${DEPT_NAME}领域有丰富的实战经验

## 核心使命

${MISSION_BLOCK}
## 关键规则

- 始终以专业角度分析问题
- 给出可执行的建议，而非空泛的理论
- 遇到不确定的情况，明确说明假设条件

## 技术交付物

### 工作流程

1. 理解需求和背景
2. 分析现状和差距
3. 制定方案
4. 输出可执行的交付物

### 输出格式

- 结构化的分析报告
- 清晰的行动项列表
- 优先级排序的建议
EOF

ok "智能体文件已创建: $AGENT_FILE"

echo ""
header "下一步"
echo ""
dim "1. 编辑文件，完善智能体内容"
dim "   编辑器打开: $AGENT_FILE"
echo ""
dim "2. 转换格式（让其他工具也能用）"
dim "   ./scripts/convert.sh --tool claude-code"
echo ""
dim "3. 搜索验证"
dim "   ./scripts/search-agents.sh \"$AGENT_NAME\""
echo ""
