# agency-agents 中文版（AI 智能体专家团队）

🌐 **简体中文** | [繁體中文](README.zh-TW.md) | [English (upstream)](https://github.com/msitarzewski/agency-agents)

> **你的 AI 梦之队** — 180 个即插即用的 AI 专家人格，支持 11 种 AI 编程工具。

[![GitHub stars](https://img.shields.io/github/stars/jnMetaCode/agency-agents-zh?style=social)](https://github.com/jnMetaCode/agency-agents-zh)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://makeapullrequest.com)

| 🤖 AI 智能体 | 🌏 英文版翻译 | 🇨🇳 中国市场原创 | 🧠 支持工具 |
|:---:|:---:|:---:|:---:|
| **180** | **135** | **45** | **11 种** |

---

## 3 分钟快速开始

一行命令，自动检测工具、转换格式、安装完成：

```bash
curl -fsSL https://raw.githubusercontent.com/Yhazrin/agency-agents-yhz/main/setup.sh | bash
```

安装完成后，用自然语言激活智能体：

```
激活前端开发者模式，帮我审查这个 React 组件。
作为小红书运营专家，帮我写一篇种草笔记。
```

> 详细安装方式（手动安装、各工具配置）请参阅 **[快速上手](docs/QUICKSTART.md)** 和 **[工具集成指南](docs/TOOLS-GUIDE.md)**。

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

| 智能体 | 专长 | 适用场景 |
|--------|------|----------|
| [UI 设计师](design/design-ui-designer.md) | 视觉设计、组件库、设计系统 | 界面设计、品牌一致性 |
| [UX 研究员](design/design-ux-researcher.md) | 用户测试、行为分析 | 用户研究、可用性测试 |
| [UX 架构师](design/design-ux-architect.md) | 信息架构、交互设计、导航系统 | 复杂产品的 UX 架构 |
| [品牌守护者](design/design-brand-guardian.md) | 品牌标识、一致性、定位 | 品牌策略、视觉规范 |
| [图像提示词工程师](design/design-image-prompt-engineer.md) | AI 图像生成、提示词优化 | Midjourney/DALL-E 出图 |
| [视觉叙事师](design/design-visual-storyteller.md) | 数据可视化、视觉叙事 | 信息图、演示文稿 |
| [趣味注入师](design/design-whimsy-injector.md) | 微交互、彩蛋、趣味元素 | 产品细节体验提升 |
| [包容性视觉专家](design/design-inclusive-visuals-specialist.md) | 多元化视觉、无障碍设计 | 包容性设计、全球化视觉 |
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
<summary><strong>🏦 金融部（3 个）</strong></summary>

财务预测分析师⭐、发票管理专家⭐、金融风控分析师⭐

> 详见 [finance/](finance/) 目录。
</details>

<details>
<summary><strong>👔 人力资源部（2 个）</strong></summary>

招聘专家⭐、绩效管理专家⭐

> 详见 [hr/](hr/) 目录。
</details>

<details>
<summary><strong>⚖️ 法务部（2 个）</strong></summary>

合同审查专家⭐、制度文件撰写专家⭐

> 详见 [legal/](legal/) 目录。
</details>

<details>
<summary><strong>🚚 供应链部（3 个）</strong></summary>

库存预测专家⭐、供应商评估专家⭐、物流路线优化师⭐

> 详见 [supply-chain/](supply-chain/) 目录。
</details>

<details>
<summary><strong>📦 产品部（5 个）</strong></summary>

Sprint 排序师、趋势研究员、反馈分析师、行为助推引擎、产品经理

> 详见 [product/](product/) 目录。
</details>

<details>
<summary><strong>📋 项目管理部（6 个）</strong></summary>

高级项目经理、项目牧羊人、实验追踪员、工作室制片人、工作室运营、Jira 工作流管家

> 详见 [project-management/](project-management/) 目录。
</details>

<details>
<summary><strong>🧪 测试部（9 个）</strong></summary>

证据收集者、现实检验者、API 测试员、性能基准师、无障碍审核员、测试结果分析师、工具评估师、工作流优化师、嵌入式测试工程师⭐

> 详见 [testing/](testing/) 目录。
</details>

<details>
<summary><strong>🤝 支持部（8 个）</strong></summary>

客服响应者、数据分析师、法务合规员、高管摘要师、财务追踪员、基础设施运维师、招聘运营专家⭐、供应链采购策略师⭐

> 详见 [support/](support/) 目录。
</details>

<details>
<summary><strong>🔬 专项部（30 个）</strong></summary>

智能体编排者、提示词工程师⭐、身份信任架构师、数据整合师、LSP 索引工程师、报告分发师、销售数据提取师、合规审计师、应付账款智能体、身份图谱操作员、文化智能策略师、开发者布道师、模型 QA 专家、ZK 管家、区块链安全审计师、留学规划顾问⭐、政务数字化售前顾问⭐、企业培训课程设计师⭐、MCP 构建器、文档生成器、工作流架构师、自动化治理架构师、Salesforce 架构师、医疗健康营销合规师⭐、高考志愿填报顾问⭐、动态定价策略师⭐、AI 治理政策专家⭐、企业风险评估师⭐、会议效率专家⭐

> 详见 [specialized/](specialized/) 目录。
</details>

<details>
<summary><strong>🥽 空间计算部（6 个）</strong></summary>

visionOS 空间工程师、macOS Metal 空间工程师、XR 界面架构师、XR 沉浸式开发者、XR 座舱交互专家、终端集成专家

> 详见 [spatial-computing/](spatial-computing/) 目录。
</details>

<details>
<summary><strong>🎮 游戏开发部（17 个）</strong></summary>

**通用：** 游戏设计师、关卡设计师、叙事设计师、技术美术、游戏音频工程师

**Unity：** Unity 架构师、Unity 编辑器工具开发者、Unity 多人游戏工程师、Unity Shader Graph 美术师

**Unreal：** Unreal 多人游戏架构师、Unreal 系统工程师、Unreal 技术美术、Unreal 世界构建师

**Blender：** Blender 插件工程师

**Godot：** Godot 游戏脚本开发者、Godot 多人游戏工程师、Godot Shader 开发者

**Roblox：** Roblox 虚拟形象创作者、Roblox 体验设计师、Roblox 系统脚本工程师

> 详见 [game-development/](game-development/) 目录。
</details>

<details>
<summary><strong>📖 学术部（6 个）</strong></summary>

人类学家、地理学家、历史学家、叙事学家、心理学家、学习规划师⭐

> 详见 [academic/](academic/) 目录。
</details>

<details>
<summary><strong>🎯 战略部</strong></summary>

从发现到运营的全流程战略指导。详见 [strategy/](strategy/) 目录。

| 文档 | 内容 |
|------|------|
| [高管简报](strategy/EXECUTIVE-BRIEF.md) | NEXUS 战略概览 |
| [快速上手](strategy/QUICKSTART.md) | 5 分钟上手指南 |
| [完整战略](strategy/nexus-strategy.md) | 运营纲领全文 |
| Phase 0-6 Playbooks | [发现](strategy/playbooks/phase-0-discovery.md) · [策略](strategy/playbooks/phase-1-strategy.md) · [基础](strategy/playbooks/phase-2-foundation.md) · [构建](strategy/playbooks/phase-3-build.md) · [加固](strategy/playbooks/phase-4-hardening.md) · [上线](strategy/playbooks/phase-5-launch.md) · [运营](strategy/playbooks/phase-6-operate.md) |
</details>

---

## 实战案例

**场景一：代码审查** — 代码审查员 + 安全工程师 + 性能基准师，全面审查 PR。[完整流程](examples/workflow-code-review.md)

**场景二：小红书品牌推广** — 小红书运营 + 内容创作者 + 品牌守护者 + 数据分析师 + 增长黑客。[完整流程](examples/workflow-xiaohongshu-launch.md)

**场景三：出海产品 MVP** — 前端开发者 + 后端架构师 + 增长黑客 + 快速原型师 + 现实检验者。

> 更多示例见 [examples/](examples/) 目录。

---

## 搜索智能体

```bash
./scripts/search-agents.sh "小红书"
./scripts/search-agents.sh "安全"
./scripts/search-agents.sh "React"
```

---

## 工具集成

支持 **11 种 AI 编程工具**：Claude Code、GitHub Copilot、Cursor、Trae、OpenClaw、OpenCode、Aider、Windsurf、Antigravity、Gemini CLI、Qwen Code。

详细安装说明请参阅 **[工具集成指南](docs/TOOLS-GUIDE.md)**。

---

## 贡献

欢迎参与！翻译智能体、改进内容、新增中国平台智能体都行。详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

## 致谢

- 原始英文版：[msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents)（MIT 协议）

---

MIT License

<div align="center">

**AI 智能体专家团队：你的 AI 梦之队**

[Star 本项目](https://github.com/jnMetaCode/agency-agents-zh) · [提交 Issue](https://github.com/jnMetaCode/agency-agents-zh/issues) · [贡献代码](https://github.com/jnMetaCode/agency-agents-zh/pulls)

</div>
