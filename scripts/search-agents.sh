#!/usr/bin/env bash
#
# search-agents.sh — 按关键词搜索智能体名称和描述
#
# 用法: ./scripts/search-agents.sh "关键词"
# 示例: ./scripts/search-agents.sh "小红书"
#       ./scripts/search-agents.sh "security"
#       ./scripts/search-agents.sh "React"

set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "用法: $0 <关键词>"
  echo "示例: $0 \"小红书\""
  exit 1
fi

KEYWORD="$1"

# 颜色
if [[ -t 1 ]]; then
  C_GREEN=$'\033[0;32m'; C_CYAN=$'\033[0;36m'; C_YELLOW=$'\033[1;33m'
  C_BOLD=$'\033[1m'; C_DIM=$'\033[2m'; C_RESET=$'\033[0m'
else
  C_GREEN=''; C_CYAN=''; C_YELLOW=''; C_BOLD=''; C_DIM=''; C_RESET=''
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

AGENT_DIRS=(
  academic design engineering finance game-development hr legal marketing
  paid-media product project-management sales supply-chain testing support
  spatial-computing specialized
)

count=0

for dir in "${AGENT_DIRS[@]}"; do
  dirpath="$REPO_ROOT/$dir"
  [[ -d "$dirpath" ]] || continue

  while IFS= read -r -d '' file; do
    # 提取 name 和 description
    local_name=""
    local_desc=""
    in_fm=0

    while IFS= read -r line; do
      if [[ "$line" == "---" ]]; then
        in_fm=$((in_fm + 1))
        [[ $in_fm -ge 2 ]] && break
        continue
      fi
      [[ $in_fm -ne 1 ]] && continue

      if [[ "$line" =~ ^name:\ (.+)$ ]]; then
        local_name="${BASH_REMATCH[1]}"
      elif [[ "$line" =~ ^description:\ (.+)$ ]]; then
        local_desc="${BASH_REMATCH[1]}"
      fi
    done < "$file"

    # 在 name、description 和文件名中搜索关键词（不区分大小写）
    search_text="$local_name $local_desc $(basename "$file")"
    if echo "$search_text" | grep -qi "$KEYWORD"; then
      count=$((count + 1))
      rel_path="${file#$REPO_ROOT/}"
      printf "${C_GREEN}%d.${C_RESET} ${C_BOLD}%s${C_RESET}\n" "$count" "$local_name"
      printf "   ${C_DIM}%s${C_RESET}\n" "$local_desc"
      printf "   ${C_CYAN}%s${C_RESET}\n" "$rel_path"
      echo ""
    fi
  done < <(find "$dirpath" -name "*.md" -type f -print0 | sort -z)
done

if [[ $count -eq 0 ]]; then
  echo "未找到匹配 \"$KEYWORD\" 的智能体。"
  echo ""
  echo "提示：尝试更短或更通用的关键词，例如："
  echo "  $0 \"前端\""
  echo "  $0 \"安全\""
  echo "  $0 \"marketing\""
else
  echo "共找到 ${count} 个匹配 \"$KEYWORD\" 的智能体。"
fi
