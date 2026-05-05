# Frontier Workflow Package â€” Setup Guide

No installation required. The MCP server is bundled in each IDE subfolder.
Open your IDE's subfolder, copy its contents into your project root, and restart.

---

## Claude Code

Copy the entire `claude-code/` folder contents into your project root:

```
claude-code/.mcp.json        â†’ <your-project>/.mcp.json
claude-code/.claude/         â†’ <your-project>/.claude/
claude-code/CLAUDE.md        â†’ <your-project>/CLAUDE.md
claude-code/.frontier/       â†’ <your-project>/.frontier/
```

Restart Claude Code. Skills appear as `/` slash commands and MCP tools immediately.

---

## Cursor

Copy the `cursor/` folder contents into your project root:

```
cursor/.cursor/mcp.json      â†’ <your-project>/.cursor/mcp.json
cursor/.frontier/            â†’ <your-project>/.frontier/
```

Restart Cursor. Skills appear as MCP tools in Agent mode.

---

## Kiro

Copy the `kiro/` folder contents into your project root:

```
kiro/.kiro/steering/         â†’ <your-project>/.kiro/steering/
kiro/.kiro/settings/mcp.json â†’ <your-project>/.kiro/settings/mcp.json
kiro/.frontier/              â†’ <your-project>/.frontier/
```

Restart Kiro. Skills appear as MCP tools automatically.

---

## VS Code / GitHub Copilot

Copy the `copilot/` folder contents into your project root:

```
copilot/.vscode/mcp.json     â†’ <your-project>/.vscode/mcp.json
copilot/.frontier/           â†’ <your-project>/.frontier/
```

Restart VS Code and enable MCP in Copilot settings. Skills appear as tools in Copilot Chat.

---

## How it works

Each IDE package contains a `.frontier/mcp-server/` folder with the Frontier MCP server source.
The MCP config launches it via `node start.js` â€” Node.js is always available in Claude Code,
Cursor, and Kiro, so **no manual installation is needed.**

On first launch the bootstrap automatically installs `uv` if needed (~15 seconds, one-time).
Every subsequent launch is instant.

> **API key note:** Each export generates a fresh key embedded in the config.
> Re-exporting invalidates the previous key â€” replace config files when you re-export.

---

## Optional â€” Per-developer analytics

Set `FRONTIER_USER_ID` in your shell profile to track skill adoption per developer:

```bash
# ~/.zshrc or ~/.bashrc
export FRONTIER_USER_ID="your-stable-id"   # UUID or employee number â€” NOT your email
```

---

## Assets in this workflow

### Skills (auto-triggered by Claude based on context)
- **feature_list_skill**: Develop a comprehensive list of features and functionalities
- **requirements_gathering_skill**: Collect and document requirements
- **document_retrieval_skill**: Retrieve relevant documents based on user queries

### Commands (user-invoked slash commands â€” type /slug in your IDE)
_No commands configured._
