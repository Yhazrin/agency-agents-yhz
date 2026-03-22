# agency-agents-yhz — AI 智能体专家团队

> **180+ 个即插即用的 AI 专家人格，一行命令装好，自然语言激活。**

[![GitHub stars](https://img.shields.io/github/stars/Yhazrin/agency-agents-yhz?style=social)](https://github.com/Yhazrin/agency-agents-yhz)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

| 🤖 智能体总数 | 🇨🇳 中国原创 | 🌏 翻译自上游 | 🧠 支持工具 | 📦 工作流模板 |
|:---:|:---:|:---:|:---:|:---:|
| **186** | **45** | **141** | **12 种** | **7 个** |

---

## 一分钟上手

```bash
curl -fsSL https://raw.githubusercontent.com/Yhazrin/agency-agents-yhz/main/setup.sh | bash
```

脚本会自动检测你装了哪些 AI 工具 → 转换格式 → 安装到位 → 打开引导页。

装完之后，用自然语言激活：

```
激活前端开发者模式，帮我审查这个 React 组件。
作为小红书运营专家，帮我写一篇种草笔记。
用代码审查员智能体，检查一下这个 PR。
```

> 手动安装或查看各工具配置，见 **[快速上手](docs/QUICKSTART.md)** · **[工具集成指南](docs/TOOLS-GUIDE.md)** · **[速查表](docs/CHEATSHEET.md)**

---

## 这个 fork 做了什么

基于 [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)（英文原版）和 [jnMetaCode/agency-agents-zh](https://github.com/jnMetaCode/agency-agents-zh)（中文社区版），本 fork 重点改进上手体验：

| 功能 | 说明 |
|------|------|
| **一行 curl 安装** | 自动检测工具、转换格式、安装，打开 Web 引导 |
| **12 种工具支持** | Claude Code、Copilot、Cursor、Trae、OpenClaw、OpenCode、Aider、Windsurf、Gemini CLI、Antigravity、Qwen Code、Codex |
| **Web 引导页** | 安装后自动打开 `guide.html`，深色/浅色自适应 |
| **工作流模板** | 7 个实战工作流（代码审查、小红书推广、产品 MVP 等） |
| **多智能体协作** | 预定义组合工作流（`workflows/`），多人协作一气呵成 |
| **智能体搜索** | `search-agents.sh "关键词"` 快速找到你要的智能体 |
| **上游同步** | `sync-upstream.sh` 自动拉取上游新增的英文智能体 |
| **速查表** | `docs/CHEATSHEET.md` — 最常用 10 个智能体 + 复制即用 prompt |

---

## 智能体阵容

> ⭐ = 本项目原创，更贴合国内实操。其余为上游英文版翻译。

<details>
<summary><strong>🛠️ 工程部（28 个）</strong></summary>

| 智能体 | 专长 | 适用场景 |
|--------|------|----------|
| [前端开发者](engineering/engineering-frontend-developer.md) | React/Vue、UI 实现、性能优化 | 现代 Web 应用、像素级 UI |
| [后端架构师](engineering/engineering-backend-architect.md) | API 设计、数据库架构、可扩展性 | 服务端系统、微服务 |
| [AI 工程师](engineering/engineering-ai-engineer.md) | 机器学习、模型部署、AI 集成 | ML 功能、数据管线 |
| [DevOps 自动化](engineering/engineering-devops-automator.md) | CI/CD、基础设施自动化 | 流水线开发、部署自动化 |
| [安全工程师](engineering/engineering-security-engineer.md) | 威胁建模、代码审计、安全架构 | 应用安全、漏洞评估 |
| [快速原型师](engineering/engineering-rapid-prototyper.md) | 快速 POC、MVP 开发 | 概念验证、黑客马拉松 |
| [高级开发者](engineering/engineering-senior-developer.md) | Laravel/Livewire/FluxUI、高端 CSS、Three.js | 高品质 Web 体验 |
| [移动应用开发者](engineering/engineering-mobile-app-builder.md) | iOS/Android 原生、跨平台框架 | 移动端开发、App 性能优化 |
| [数据工程师](engineering/engineering-data-engineer.md) | ETL/ELT、数据湖、Spark/dbt | 数据管线、数据仓库 |
| [技术文档工程师](engineering/engineering-technical-writer.md) | API 文档、开发者文档、docs-as-code | 技术文档、知识库 |
| [自主优化架构师](engineering/engineering-autonomous-optimization-architect.md) | 自适应系统、自动调优 | 智能运维、自愈系统 |
| [嵌入式固件工程师](engineering/engineering-embedded-firmware-engineer.md) | RTOS、外设驱动、低功耗设计 | IoT、嵌入式系统 |
| [嵌入式 Linux 驱动工程师](engineering/engineering-embedded-linux-driver-engineer.md) ⭐ | 内核模块、设备树、Platform/I2C/SPI 驱动 | 嵌入式 Linux BSP 开发 |
| [FPGA/ASIC 数字设计工程师](engineering/engineering-fpga-digital-design-engineer.md) ⭐ | Verilog/SystemVerilog、时序收敛、AXI 总线 | FPGA 开发、数字逻辑设计 |
| [IoT 方案架构师](engineering/engineering-iot-solution-architect.md) ⭐ | MQTT/CoAP、边缘计算、设备管理、云平台 | 物联网端到端方案设计 |
| [故障响应指挥官](engineering/engineering-incident-response-commander.md) | 故障处置、SLO 管理、事后复盘 | 线上故障、应急响应 |
| [威胁检测工程师](engineering/engineering-threat-detection-engineer.md) | SIEM、威胁狩猎、检测规则 | 安全运营、威胁检测 |
| [Solidity 智能合约工程师](engineering/engineering-solidity-smart-contract-engineer.md) | Solidity、EVM、Gas 优化、DeFi | 智能合约开发、Web3 |
| [微信小程序开发者](engineering/engineering-wechat-mini-program-developer.md) ⭐ | WXML/WXSS、微信支付、云开发 | 微信小程序全栈开发 |
| [代码审查员](engineering/engineering-code-reviewer.md) | 代码审查、安全审计、质量把关 | PR 审查、代码质量 |
| [数据库优化师](engineering/engineering-database-optimizer.md) | Schema 设计、查询优化、索引策略 | 数据库性能调优 |
| [Git 工作流大师](engineering/engineering-git-workflow-master.md) | 分支策略、约定式提交、变基 | Git 工作流规范 |
| [软件架构师](engineering/engineering-software-architect.md) | 系统设计、DDD、架构决策 | 系统架构设计 |
| [SRE](engineering/engineering-sre.md) | SLO、可观测性、混沌工程 | 站点可靠性工程 |
| [AI 数据修复工程师](engineering/engineering-ai-data-remediation-engineer.md) | 自愈管道、SLM 语义聚类、零数据丢失 | 大规模数据异常修复 |
| [飞书集成开发工程师](engineering/engineering-feishu-integration-developer.md) ⭐ | 飞书机器人、审批流、多维表格 | 飞书生态集成开发 |
| [钉钉集成开发工程师](engineering/engineering-dingtalk-integration-developer.md) ⭐ | 钉钉机器人、酷应用、连接器 | 钉钉生态集成开发 |
</details>

<details>
<summary><strong>🎨 设计部（8 个）</strong></summary>

UI 设计师、UX 研究员、UX 架构师、品牌守护者、图像提示词工程师、视觉叙事师、趣味注入师、包容性视觉专家

> 详见 [design/](design/) 目录。
</details>

<details>
<summary><strong>📢 营销部（31 个）</strong></summary>

**国内平台：** 小红书运营⭐、抖音策略师⭐、微信公众号运营⭐、B站内容策略师⭐、快手策略师⭐、中国电商运营师、电商运营师⭐、百度 SEO 专家⭐、私域流量运营师⭐、直播电商主播教练⭐、跨境电商运营专家⭐、短视频剪辑指导师⭐、微博运营策略师⭐、播客内容策略师⭐、微信视频号运营策略师⭐、知识付费产品策划师⭐、小红书专家、微信公众号管理、知乎策略师

**出海营销：** TikTok 策略师、Twitter 互动官、Instagram 策展师、Reddit 社区运营、应用商店优化师

**通用：** 增长黑客、内容创作者、社交媒体策略师、SEO 专家、轮播图增长引擎、LinkedIn 内容创作专家、图书联合作者

> 详见 [marketing/](marketing/) 目录。
</details>

<details>
<summary><strong>💰 付费媒体部（7 个）</strong></summary>

付费媒体审计师、广告创意策略师、社交广告策略师、PPC 竞价策略师、程序化广告采买专家、搜索词分析师、追踪与归因专家

> 详见 [paid-media/](paid-media/) 目录。
</details>

<details>
<summary><strong>💼 销售部（8 个）</strong></summary>

客户拓展策略师、销售教练、赢单策略师、Discovery 教练、售前工程师、Outbound 策略师、Pipeline 分析师、投标策略师

> 详见 [sales/](sales/) 目录。
</details>

<details>
<summary><strong>🏦 金融部（3 个）⭐ · 👔 人力资源部（2 个）⭐ · ⚖️ 法务部（2 个）⭐ · 🚚 供应链部（3 个）⭐</strong></summary>

- **金融：** 财务预测分析师、发票管理专家、金融风控分析师 → [finance/](finance/)
- **HR：** 招聘专家、绩效管理专家 → [hr/](hr/)
- **法务：** 合同审查专家、制度文件撰写专家 → [legal/](legal/)
- **供应链：** 库存预测专家、供应商评估专家、物流路线优化师 → [supply-chain/](supply-chain/)
</details>

<details>
<summary><strong>📦 产品部（5 个） · 📋 项目管理部（6 个） · 🧪 测试部（9 个）</strong></summary>

- **产品：** Sprint 排序师、趋势研究员、反馈分析师、行为助推引擎、产品经理 → [product/](product/)
- **项目管理：** 高级项目经理、项目牧羊人、实验追踪员、工作室制片人、工作室运营、Jira 工作流管家 → [project-management/](project-management/)
- **测试：** 证据收集者、现实检验者、API 测试员、性能基准师、无障碍审核员、测试结果分析师、工具评估师、工作流优化师、嵌入式测试工程师⭐ → [testing/](testing/)
</details>

<details>
<summary><strong>🤝 支持部（8 个） · 🔬 专项部（30 个） · 🥽 空间计算部（6 个）</strong></summary>

- **支持：** 客服响应者、数据分析师、法务合规员、高管摘要师、财务追踪员、基础设施运维师、招聘运营专家⭐、供应链采购策略师⭐ → [support/](support/)
- **专项：** 智能体编排者、提示词工程师⭐、身份信任架构师、MCP 构建器、工作流架构师、Salesforce 架构师 等 30 个 → [specialized/](specialized/)
- **空间计算：** visionOS 空间工程师、macOS Metal 空间工程师、XR 界面架构师 等 6 个 → [spatial-computing/](spatial-computing/)
</details>

<details>
<summary><strong>🎮 游戏开发部（17 个） · 📖 学术部（6 个）</strong></summary>

- **游戏开发：** 通用 5 个 + Unity 4 个 + Unreal 4 个 + Blender 1 个 + Godot 3 个 + Roblox 3 个 → [game-development/](game-development/)
- **学术：** 人类学家、地理学家、历史学家、叙事学家、心理学家、学习规划师⭐ → [academic/](academic/)
</details>

> 完整列表见 [AGENT-LIST.md](AGENT-LIST.md)，战略相关见 [strategy/](strategy/)。

---

## 实战工作流

不只是单个智能体——预定义的多智能体协作流程：

| 场景 | 用到的智能体 | 链接 |
|------|------------|------|
| **代码审查** | 代码审查员 + 安全工程师 + 性能基准师 | [查看](examples/workflow-code-review.md) |
| **小红书品牌推广** | 小红书运营 + 内容创作者 + 品牌守护者 + 数据分析师 + 增长黑客 | [查看](examples/workflow-xiaohongshu-launch.md) |
| **出海产品 MVP** | 前端开发者 + 后端架构师 + 快速原型师 + 增长黑客 + 现实检验者 | [查看](examples/workflow-startup-mvp.md) |
| **产品发布全流程** | 产品经理 → 前端 → 后端 → 测试 → 营销 | [查看](workflows/product-launch.md) |
| **营销活动** | 营销策略师 → 内容创作者 → 数据分析师 → 增长黑客 | [查看](workflows/marketing-campaign.md) |

> 更多工作流见 [examples/](examples/) 和 [workflows/](workflows/) 目录。

---

## 搜索智能体

180+ 个太多了找不到？用搜索脚本：

```bash
./scripts/search-agents.sh "小红书"
./scripts/search-agents.sh "安全"
./scripts/search-agents.sh "React"
```

---

## 工具集成

支持 **12 种 AI 编程工具**：Claude Code、GitHub Copilot、Cursor、Trae、OpenClaw、OpenCode、Aider、Windsurf、Gemini CLI、Antigravity、Qwen Code、Codex CLI。

详细安装说明见 **[工具集成指南](docs/TOOLS-GUIDE.md)**。

---

## 实用脚本

| 脚本 | 用途 |
|------|------|
| `setup.sh` | 一键安装（curl 用） |
| `scripts/install.sh` | 安装到指定工具 |
| `scripts/convert.sh` | 转换智能体格式 |
| `scripts/search-agents.sh` | 按关键词搜索智能体 |
| `scripts/create-agent.sh` | 交互式创建自定义智能体 |
| `scripts/sync-upstream.sh` | 同步上游新增智能体 |
| `scripts/lint-agents.sh` | 校验智能体文件格式 |

---

## 贡献

欢迎参与！翻译智能体、改进内容、新增中国平台智能体都行。详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

## 致谢

- 原始英文版：[msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)（MIT 协议）
- 中文社区版：[jnMetaCode/agency-agents-zh](https://github.com/jnMetaCode/agency-agents-zh)

---

MIT License

<div align="center">

**agency-agents-yhz：你的 AI 梦之队**

[Star 本项目](https://github.com/Yhazrin/agency-agents-yhz) · [提交 Issue](https://github.com/Yhazrin/agency-agents-yhz/issues) · [贡献代码](https://github.com/Yhazrin/agency-agents-yhz/pulls)

</div>
