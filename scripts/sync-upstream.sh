#!/usr/bin/env bash
#
# sync-upstream.sh — 同步上游 msitarzewski/agency-agents 的新增智能体
#
# 用法: ./scripts/sync-upstream.sh
#
# 流程: 检测/添加 upstream remote → fetch → 列出新增文件 → 提示翻译

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
dim()    { printf "${C_DIM}%s${C_RESET}\n" "$*"; }

UPSTREAM_URL="https://github.com/msitarzewski/agency-agents.git"
UPSTREAM_NAME="upstream"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

# --- 1. 检测/添加 upstream remote ---
header "检查 upstream remote..."

if git remote get-url "$UPSTREAM_NAME" >/dev/null 2>&1; then
  existing_url=$(git remote get-url "$UPSTREAM_NAME")
  if [[ "$existing_url" != "$UPSTREAM_URL" ]]; then
    warn "upstream remote 已存在但 URL 不同: $existing_url"
    warn "期望: $UPSTREAM_URL"
    warn "如需更新，请手动执行: git remote set-url upstream $UPSTREAM_URL"
    exit 1
  fi
  ok "upstream remote 已配置"
else
  git remote add "$UPSTREAM_NAME" "$UPSTREAM_URL"
  ok "已添加 upstream remote: $UPSTREAM_URL"
fi

# --- 2. Fetch 上游 ---
header "获取上游更新..."

if ! git fetch upstream --depth=1 2>/dev/null; then
  err "无法连接上游仓库。请检查网络连接。"
  err "上游地址: $UPSTREAM_URL"
  exit 1
fi
ok "上游数据已获取"

# --- 3. 对比差异 ---
header "分析差异..."

# 获取上游的智能体文件列表（排除非智能体目录）
AGENT_DIRS="academic design engineering finance game-development hr legal marketing paid-media product project-management sales spatial-computing specialized supply-chain testing support"

UPSTREAM_FILES=$(git ls-tree -r --name-only upstream/main -- $AGENT_DIRS 2>/dev/null || \
                 git ls-tree -r --name-only upstream/master -- $AGENT_DIRS 2>/dev/null || \
                 git ls-tree -r --name-only upstream HEAD -- $AGENT_DIRS 2>/dev/null)

LOCAL_FILES=$(git ls-tree -r --name-only HEAD -- $AGENT_DIRS 2>/dev/null)

# 找出上游有但本地没有的文件（新增智能体）
NEW_FILES=()
while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  if ! echo "$LOCAL_FILES" | grep -qF "$line"; then
    NEW_FILES+=("$line")
  fi
done <<< "$UPSTREAM_FILES"

# 找出上游修改过的文件（可能需要更新翻译）
MODIFIED_FILES=()
while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  if echo "$LOCAL_FILES" | grep -qF "$line"; then
    # 比较文件内容
    upstream_content=$(git show "upstream/main:$line" 2>/dev/null || git show "upstream/master:$line" 2>/dev/null || echo "")
    local_content=$(git show "HEAD:$line" 2>/dev/null || echo "")
    if [[ -n "$upstream_content" && "$upstream_content" != "$local_content" ]]; then
      MODIFIED_FILES+=("$line")
    fi
  fi
done <<< "$UPSTREAM_FILES"

# --- 4. 报告结果 ---
echo ""

if [[ ${#NEW_FILES[@]} -eq 0 && ${#MODIFIED_FILES[@]} -eq 0 ]]; then
  ok "本地已与上游同步，没有发现新增或变更的智能体。"
  exit 0
fi

if [[ ${#NEW_FILES[@]} -gt 0 ]]; then
  header "上游新增智能体（${#NEW_FILES[@]} 个）"
  echo ""
  for f in "${NEW_FILES[@]}"; do
    # 提取英文名称
    en_name=$(basename "$f" .md)
    printf "  ${C_GREEN}+${C_RESET} %s\n" "$f"
  done

  echo ""
  printf "${C_BOLD}自动拉取新增文件？${C_RESET} [y/N]: "
  if [[ -t 0 ]]; then
    read -r choice </dev/tty
  else
    choice="N"
  fi

  if [[ "$choice" =~ ^[Yy]$ ]]; then
    for f in "${NEW_FILES[@]}"; do
      # 从上游检出文件
      git checkout "upstream/main:$f" > /dev/null 2>&1 || \
      git checkout "upstream/master:$f" > /dev/null 2>&1 || {
        warn "无法检出: $f"
        continue
      }
      # 创建目录（如果需要）
      dir=$(dirname "$f")
      mkdir -p "$dir"
      git show "upstream/main:$f" > "$f" 2>/dev/null || \
      git show "upstream/master:$f" > "$f" 2>/dev/null || true
      ok "已拉取: $f"
    done
    echo ""
    warn "新增文件已拉取（英文原版）。请翻译后提交。"
    warn "翻译后记得运行: ./scripts/convert.sh 更新各工具格式。"
  else
    dim "跳过自动拉取。手动拉取："
    dim "  git checkout upstream/main -- <file>"
  fi
fi

if [[ ${#MODIFIED_FILES[@]} -gt 0 ]]; then
  echo ""
  header "上游已更新的文件（${#MODIFIED_FILES[@]} 个）"
  echo ""
  for f in "${MODIFIED_FILES[@]}"; do
    printf "  ${C_YELLOW}~${C_RESET} %s\n" "$f"
  done
  echo ""
  warn "以上文件在上游有更新，可能需要同步翻译。"
  warn "查看差异: git diff HEAD upstream/main -- <file>"
fi

echo ""
ok "同步分析完成。"
