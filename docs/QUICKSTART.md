# 快速上手

3 分钟内让你的 AI 工具拥有 180 个专业智能体。

---

## 路径 A：一键安装（推荐，1 分钟）

一行命令，自动检测工具、转换格式、安装完成。

**macOS / Linux：**

```bash
curl -fsSL https://raw.githubusercontent.com/Yhazrin/agency-agents-yhz/main/setup.sh | bash
```

**Windows (PowerShell)：**

```powershell
# 先安装 Git for Windows，然后在 Git Bash 中运行：
curl -fsSL https://raw.githubusercontent.com/Yhazrin/agency-agents-yhz/main/setup.sh | bash
```

脚本会自动：
1. 检测你已安装的 AI 工具（Claude Code、Cursor、Copilot 等）
2. 转换智能体格式
3. 安装到对应工具的目录
4. 打开使用引导

---

## 路径 B：手动安装（开发者，2 分钟）

适合想了解内部流程或需要自定义安装的开发者。

```bash
# 1. 克隆仓库
git clone https://github.com/Yhazrin/agency-agents-yhz.git
cd agency-agents-yhz

# 2. 转换格式（Claude Code / Copilot 可跳过）
./scripts/convert.sh

# 3. 安装（自动检测已安装的工具）
./scripts/install.sh

# 或安装到指定工具
./scripts/install.sh --tool claude-code
```

支持的工具：`claude-code`、`copilot`、`cursor`、`trae`、`opencode`、`openclaw`、`aider`、`windsurf`、`antigravity`、`gemini-cli`、`qwen`

---

## 路径 C：手动复制（非技术用户，5 分钟）

不需要命令行，直接在 GitHub 上操作。

1. 打开 [智能体列表](https://github.com/Yhazrin/agency-agents-yhz)
2. 进入你想用的部门目录（如 `engineering/`、`marketing/`）
3. 打开智能体 `.md` 文件，复制全部内容
4. 粘贴到你的 AI 工具中作为系统提示词或上下文

例如，在 Claude Code 中：
```
请参考以下专家人格帮我工作：

[粘贴智能体内容]
```

---

## 安装后怎么用？

安装完成后，在你的 AI 工具中通过自然语言激活智能体：

```
激活前端开发者模式，帮我审查这个 React 组件。
```

```
作为小红书运营专家，帮我写一篇种草笔记。
```

```
使用代码审查员智能体，检查这个 PR 的安全问题。
```

## 找不到想要的智能体？

```bash
# 搜索智能体（支持中英文关键词）
./scripts/search-agents.sh "安全"
./scripts/search-agents.sh "React"
```

## 常见问题

**Q：安装后智能体没有生效？**
- Claude Code：重启 Claude Code 会话
- Cursor：重启 Cursor 或重新打开项目
- 其他工具：检查安装目录是否正确

**Q：如何更新智能体？**
```bash
cd agency-agents-yhz
git pull
./scripts/convert.sh
./scripts/install.sh
```

**Q：如何只安装部分智能体？**
手动复制你需要的 `.md` 文件到对应目录即可。

---

更多工具详细配置请参阅 [工具集成指南](TOOLS-GUIDE.md)。
