# 从 VSCode 导入主题到 Cursor

## 方法 1: 使用脚本自动导入

运行脚本（如果 VSCode 配置在标准位置）：
```bash
python3 import_vscode_theme.py
```

如果 VSCode 配置在其他位置，手动指定路径：
```bash
python3 import_vscode_theme.py ~/path/to/vscode/settings.json
```

## 方法 2: 手动操作（推荐）

### 步骤 1: 在 VSCode 中查看当前主题
1. 打开 VSCode
2. 按 `Ctrl+Shift+P` (Linux) 或 `Cmd+Shift+P` (Mac)
3. 输入 `Preferences: Color Theme`
4. 记下当前选中的主题名称（例如：`Monokai`, `Solarized Dark`, `One Dark Pro` 等）

### 步骤 2: 在 Cursor 中应用相同主题
1. 打开 Cursor
2. 按 `Ctrl+Shift+P` (Linux) 或 `Cmd+Shift+P` (Mac)
3. 输入 `Preferences: Color Theme`
4. 选择与 VSCode 相同的主题

## 方法 3: 直接编辑配置文件

### 查找 VSCode 主题设置
```bash
# 查找 VSCode 配置文件
find ~/.config -name "settings.json" -path "*/Code/User/*" 2>/dev/null
find ~ -name "settings.json" -path "*/.vscode/*" 2>/dev/null

# 查看主题设置
cat ~/.config/Code/User/settings.json | grep colorTheme
```

### 应用到 Cursor
编辑工作区配置 `.vscode/settings.json` 或 Cursor 全局配置 `~/.config/Cursor/User/settings.json`：

```json
{
  "workbench.colorTheme": "你的主题名称"
}
```

## 常见主题名称
- `Default Dark+` - VSCode 默认深色主题
- `Default Light+` - VSCode 默认浅色主题
- `Monokai` - Monokai 主题
- `Solarized Dark` - Solarized 深色
- `Solarized Light` - Solarized 浅色
- `One Dark Pro` - One Dark Pro
- `Material Theme` - Material 主题
- `Dracula` - Dracula 主题

## 提示
- 如果主题未安装，Cursor 会自动提示安装
- 重启 Cursor 或使用 `Ctrl+Shift+P` -> `Developer: Reload Window` 使更改生效


