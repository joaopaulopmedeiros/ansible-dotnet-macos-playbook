# ansible-dotnet-macos-playbook

Ansible playbook for spinning up a .NET development environment with ease on macOS.

It provisions your Mac (via Homebrew) with:

- .NET SDK (`dotnet-sdk` cask) and the dotnet CLI
- Global diagnostic tools: dotnet-counters, dotnet-dump, dotnet-trace
- Visual Studio Code (`visual-studio-code` cask)
- VS Code extensions: C# Dev Kit, C# and IntelliCode for C#

## Requirements

- macOS
- [Homebrew](https://brew.sh) installed:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Ansible installed on your Mac:
  ```bash
  brew install ansible
  ```
  (or `python3 -m pip install --user ansible`, then add `~/Library/Python/3.x/bin` to your PATH)

## Usage

```bash
ansible-playbook -i inventory.ini playbook.yml
```

## Configuration

Override defaults via `--extra-vars` or by editing the role `defaults/main.yml` files:

| Variable              | Default                                      | Description                          |
|-----------------------|-----------------------------------------------|---------------------------------------|
| `dotnet_cask`          | `dotnet-sdk`                                  | Homebrew cask for the .NET SDK       |
| `dotnet_global_tools`  | `dotnet-counters`, `dotnet-dump`, `dotnet-trace` | Global CLI tools installed          |
| `vscode_cask`          | `visual-studio-code`                          | Homebrew cask for VS Code            |
| `vscode_extensions`    | `ms-dotnettools.csdevkit`, `ms-dotnettools.csharp`, `ms-dotnettools.vscodeintellicode-csharp` | VS Code extensions installed |

Example:

```bash
ansible-playbook -i inventory.ini playbook.yml \
  --extra-vars "dotnet_cask=dotnet-sdk"
```
