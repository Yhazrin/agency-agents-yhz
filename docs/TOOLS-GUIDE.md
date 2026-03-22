# 工具集成指南

本项目支持 **11 种 AI 编程工具**。本文档提供每种工具的详细安装和配置说明。

---

## 快速参考

| 工具 | 安装位置 | 类型 |
|------|----------|------|
| **Claude Code** | `~/.claude/agents/` | 全局，直接复制 |
| **GitHub Copilot** | `~/.github/agents/` + `~/.copilot/agents/` | 全局，直接复制 |
| **OpenClaw** | `~/.openclaw/agency-agents/` | 全局，需转换 |
| **Antigravity** | `~/.gemini/antigravity/skills/` | 全局，需转换 |
| **Gemini CLI** | `~/.gemini/extensions/agency-agents/` | 全局，需转换 |
| **Qwen Code** | `.qwen/agents/` | 项目级，需转换 |
| **Cursor** | `.cursor/rules/` | 项目级，需转换 |
| **Trae** | `.trae/rules/` | 项目级，需转换 |
| **OpenCode** | `.opencode/agents/` | 项目级，需转换 |
| **Aider** | `CONVENTIONS.md` | 项目级，需转换 |
| **Windsurf** | `.windsurfrules` | 项目级，需转换 |

## 通用命令

```bash
# 转换格式（Claude Code 和 Copilot 可跳过）
./scripts/convert.sh                    # 所有工具
./scripts/convert.sh --tool cursor      # 仅指定工具

# 安装（自动检测或指定工具）
./scripts/install.sh                    # 自动检测
./scripts/install.sh --tool claude-code # 指定工具

# 检查智能体文件格式
./scripts/lint-agents.sh

# 搜索智能体
./scripts/search-agents.sh "关键词"
```

---

## Claude Code

智能体直接从仓库复制到 `~/.claude/agents/`，无需转换。

```bash
./scripts/install.sh --tool claude-code
```

**激活方式**：
```
激活前端开发者模式，帮我审查这个组件。
```

**验证**：检查 `~/.claude/agents/` 目录下是否有 `.md` 文件。

---

## GitHub Copilot

智能体直接复制到两个目录：`~/.github/agents/` 和 `~/.copilot/agents/`。

```bash
./scripts/install.sh --tool copilot
```

**激活方式**：
```
使用前端开发者智能体帮我审查这个组件。
```

---

## OpenClaw

OpenClaw 将每个智能体拆分为三个文件：
- `SOUL.md` — 身份、记忆、沟通风格、关键规则
- `AGENTS.md` — 核心使命、技术交付物、工作流程
- `IDENTITY.md` — 名称与简介

```bash
./scripts/convert.sh --tool openclaw
./scripts/install.sh --tool openclaw

# 安装后重启网关
openclaw gateway restart
```

**激活方式**：OpenClaw 支持多智能体协作编排，详见 OpenClaw 文档。

---

## Antigravity (Gemini)

转换为 Antigravity skill 格式并安装到 `~/.gemini/antigravity/skills/`。

```bash
./scripts/convert.sh --tool antigravity
./scripts/install.sh --tool antigravity
```

---

## Gemini CLI

转换为 Gemini CLI 扩展格式并安装到 `~/.gemini/extensions/agency-agents/`。

```bash
./scripts/convert.sh --tool gemini-cli
./scripts/install.sh --tool gemini-cli
```

---

## Qwen Code

转换为 Qwen Code SubAgent 格式并安装到项目目录 `.qwen/agents/`。

```bash
./scripts/convert.sh --tool qwen
cd /your/project
/path/to/agency-agents-yhz/scripts/install.sh --tool qwen
```

**激活方式**：
```
使用前端开发者智能体帮我审查这个组件。
```

> 提示：安装后在 Qwen Code 中运行 `/agents manage` 刷新，或重启会话。

---

## Cursor

转换为 Cursor rule 文件（`.mdc`）并安装到项目目录 `.cursor/rules/`。

```bash
./scripts/convert.sh --tool cursor
cd /your/project
/path/to/agency-agents-yhz/scripts/install.sh --tool cursor
```

---

## Trae

转换为 Trae rule 文件并安装到项目目录 `.trae/rules/`。格式与 Cursor 类似。

```bash
./scripts/convert.sh --tool trae
cd /your/project
/path/to/agency-agents-yhz/scripts/install.sh --tool trae
```

---

## OpenCode

转换为 OpenCode agent 文件并安装到项目目录 `.opencode/agents/`。

```bash
./scripts/convert.sh --tool opencode
cd /your/project
/path/to/agency-agents-yhz/scripts/install.sh --tool opencode
```

---

## Aider

所有智能体编译为单个 `CONVENTIONS.md` 文件，Aider 会自动读取。

```bash
./scripts/convert.sh --tool aider
cd /your/project
/path/to/agency-agents-yhz/scripts/install.sh --tool aider
```

**激活方式**：
```
使用前端开发者智能体帮我重构这个组件。
```

---

## Windsurf

所有智能体编译为单个 `.windsurfrules` 文件。

```bash
./scripts/convert.sh --tool windsurf
cd /your/project
/path/to/agency-agents-yhz/scripts/install.sh --tool windsurf
```

---

## 修改智能体后重新生成

```bash
./scripts/convert.sh               # 重新生成所有工具
./scripts/convert.sh --tool cursor  # 只重新生成指定工具
```
