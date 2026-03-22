#!/usr/bin/env bash
#
# setup.sh — agency-agents-yhz 一键安装脚本
#
# 用法：
#   curl -fsSL https://raw.githubusercontent.com/Yhazrin/agency-agents-yhz/main/setup.sh | bash
#
# 流程：检测 git → clone 到临时目录 → 转换格式 → 安装 → 打开引导 → 清理

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

REPO_URL="https://github.com/Yhazrin/agency-agents-yhz.git"
GUIDE_DIR="${HOME}/.agency-agents-zh"

# --- 终端引导 ---
show_terminal_guide() {
  local tool_name="${1:-AI 工具}"
  local agent_count="${2:-180}"
  local B="║"; local TL="╔"; local TR="╗"; local BL="╚"; local BR="╝"
  local H="═"; local LH="╠"; local RH="╣"; local S="─"; local MT="╤"; local MB="╧"

  printf "\n"
  printf "${C_CYAN}${TL}══════════════════════════════════════════════════════════${TR}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}  ${C_BOLD}agency-agents-yhz 安装成功${C_RESET}                          ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${LH}══════════════════════════════════════════════════════════${RH}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}  已安装: ${C_GREEN}${tool_name}${C_RESET} (${agent_count} 个智能体)                   ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}                                                     ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}  ${C_BOLD}使用方式${C_RESET}：直接用自然语言激活                          ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}    "激活前端开发者模式，帮我审查代码"                      ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}    "作为小红书运营专家，写一篇种草笔记"                    ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}    "使用代码审查员智能体，检查 PR"                        ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}                                                     ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}  ${C_BOLD}热门智能体${C_RESET}：                                      ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}    ${C_GREEN}·${C_RESET} 前端开发者      ${C_GREEN}·${C_RESET} 后端架构师                    ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}    ${C_GREEN}·${C_RESET} 小红书运营专家  ${C_GREEN}·${C_RESET} 代码审查员                    ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}    ${C_GREEN}·${C_RESET} 数据分析师      ${C_GREEN}·${C_RESET} UI 设计师                     ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}                                                     ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}  ${C_BOLD}搜索智能体${C_RESET}：                                        ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}    ${C_DIM}./scripts/search-agents.sh "关键词"${C_RESET}               ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}                                                     ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${B}${C_RESET}  ${C_CYAN}https://github.com/Yhazrin/agency-agents-yhz${C_RESET}     ${C_CYAN}${B}${C_RESET}\n"
  printf "${C_CYAN}${BL}══════════════════════════════════════════════════════════${BR}${C_RESET}\n"
  printf "\n"
}

# --- 主流程 ---
main() {
  header "agency-agents-yhz 一键安装"
  printf "\n"

  # 1. 检测 git
  if ! command -v git >/dev/null 2>&1; then
    err "未找到 git。请先安装 git：https://git-scm.com/downloads"
    exit 1
  fi

  # 2. 创建临时目录并 clone
  TMPDIR=$(mktemp -d 2>/dev/null || mktemp -d -t 'agency-agents')
  trap 'rm -rf "$TMPDIR"' EXIT

  printf "${C_DIM}正在下载智能体仓库...${C_RESET}\n"
  if ! git clone --depth 1 "$REPO_URL" "$TMPDIR/agency-agents-yhz" 2>/dev/null; then
    err "下载失败。请检查网络连接或手动 clone："
    err "  git clone $REPO_URL"
    exit 1
  fi
  ok "仓库下载完成"

  cd "$TMPDIR/agency-agents-yhz"

  # 3. 转换格式
  header "转换智能体格式..."
  bash ./scripts/convert.sh

  # 4. 安装
  header "安装智能体..."
  bash ./scripts/install.sh

  # 5. 复制 guide.html
  mkdir -p "$GUIDE_DIR"
  if [[ -f "./guide.html" ]]; then
    cp "./guide.html" "$GUIDE_DIR/guide.html"
    ok "使用指南已复制到 $GUIDE_DIR/guide.html"
  fi

  # 6. 引导选择
  printf "\n"
  local tool_name="AI 工具"
  # 尝试从 install 输出推断安装的工具
  local detected_tools=()
  local ALL_TOOLS=(claude-code copilot antigravity gemini-cli opencode openclaw cursor trae aider windsurf qwen)
  for t in "${ALL_TOOLS[@]}"; do
    case "$t" in
      claude-code) [[ -d "${HOME}/.claude" ]] && detected_tools+=("Claude Code") ;;
      copilot)     (command -v code >/dev/null 2>&1 || [[ -d "${HOME}/.github" ]]) && detected_tools+=("Copilot") ;;
      cursor)      (command -v cursor >/dev/null 2>&1 || [[ -d "${HOME}/.cursor" ]]) && detected_tools+=("Cursor") ;;
      trae)        (command -v trae >/dev/null 2>&1 || [[ -d "${HOME}/.trae" ]]) && detected_tools+=("Trae") ;;
      opencode)    (command -v opencode >/dev/null 2>&1 || [[ -d "${HOME}/.config/opencode" ]]) && detected_tools+=("OpenCode") ;;
      openclaw)    (command -v openclaw >/dev/null 2>&1 || [[ -d "${HOME}/.openclaw" ]]) && detected_tools+=("OpenClaw") ;;
      aider)       command -v aider >/dev/null 2>&1 && detected_tools+=("Aider") ;;
      windsurf)    (command -v windsurf >/dev/null 2>&1 || [[ -d "${HOME}/.codeium" ]]) && detected_tools+=("Windsurf") ;;
      gemini-cli)  (command -v gemini >/dev/null 2>&1 || [[ -d "${HOME}/.gemini" ]]) && detected_tools+=("Gemini CLI") ;;
      antigravity) [[ -d "${HOME}/.gemini/antigravity/skills" ]] && detected_tools+=("Antigravity") ;;
      qwen)        (command -v qwen >/dev/null 2>&1 || [[ -d "${HOME}/.qwen" ]]) && detected_tools+=("Qwen Code") ;;
    esac
  done
  if [[ ${#detected_tools[@]} -gt 0 ]]; then
    tool_name="${detected_tools[*]}"
  fi

  printf "${C_BOLD}安装完成！${C_RESET} 已为 ${C_GREEN}${tool_name}${C_RESET} 安装 180 个智能体。\n"
  printf "\n"
  printf "查看使用指南：\n"
  printf "  ${C_GREEN}[1]${C_RESET} 在浏览器中打开（推荐）\n"
  printf "  ${C_GREEN}[2]${C_RESET} 在终端中显示\n"
  printf "  ${C_GREEN}[3]${C_RESET} 跳过\n"
  printf "\n"

  if [[ -t 0 ]]; then
    read -r -p "请选择 [1/2/3]: " choice </dev/tty
  else
    choice="1"
  fi

  case "$choice" in
    1)
      local guide_path="$GUIDE_DIR/guide.html"
      if [[ -f "$guide_path" ]]; then
        if command -v xdg-open >/dev/null 2>&1; then
          xdg-open "$guide_path" 2>/dev/null &
        elif command -v open >/dev/null 2>&1; then
          open "$guide_path" 2>/dev/null &
        elif command -v start >/dev/null 2>&1; then
          start "$guide_path" 2>/dev/null &
        else
          warn "无法自动打开浏览器。请手动打开：$guide_path"
        fi
        ok "已在浏览器中打开使用指南"
      else
        warn "guide.html 未找到。"
        show_terminal_guide "$tool_name"
      fi
      ;;
    2)
      show_terminal_guide "$tool_name"
      ;;
    *)
      printf "\n"
      dim "跳过引导。随时查看指南：$GUIDE_DIR/guide.html"
      dim "或访问：https://github.com/Yhazrin/agency-agents-yhz"
      ;;
  esac

  printf "\n"
  ok "全部完成！重启你的 AI 工具后即可使用。"
}

main "$@"
