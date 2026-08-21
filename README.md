# ansible-dotnet-macos-playbook
 
Ansible playbook for spinning up a .NET development environment with ease on macOS.
 
It provisions your Mac (via Homebrew) with:
 
- .NET SDK (`dotnet-sdk` cask) and the dotnet CLI
- Global diagnostic tools: dotnet-counters, dotnet-dump, dotnet-trace
- Visual Studio Code (`visual-studio-code` cask)
- VS Code extensions: C# Dev Kit, C#, and IntelliCode for C#

## Quick start
 
```bash
make setup      # installs Homebrew + Ansible (if needed), then runs the playbook
source ~/.zshrc # reload your shell so new PATH entries take effect
make verify     # check that dotnet, dotnet-counters, dotnet-dump, dotnet-trace, code are all found
```
 
## Prerequisites
 
- macOS
- `make` (comes pre-installed on macOS)
Everything else, Homebrew, Ansible...is handled automatically by `make setup`. No manual setup required.
 
## Usage
 
```bash
make help    # list all available commands
make setup   # provision the .NET dev environment
make verify  # confirm dotnet/dotnet-counters/dotnet-dump/dotnet-trace/code are on PATH
```
 
## Configuration
 
Override defaults via `--extra-vars` or by editing the role `defaults/main.yml` files:
 
| Variable              | Default                                      | Description                          |
|-----------------------|-----------------------------------------------|---------------------------------------|
| `dotnet_cask`          | `dotnet-sdk`                                  | Homebrew cask for the .NET SDK       |
| `dotnet_global_tools`  | `dotnet-counters`, `dotnet-dump`, `dotnet-trace` | Global CLI tools installed          |
| `vscode_cask`          | `visual-studio-code`                          | Homebrew cask for VS Code            |
| `vscode_extensions`    | `ms-dotnettools.csdevkit`, `ms-dotnettools.csharp`, `ms-dotnettools.vscodeintellicode-csharp` | VS Code extensions installed |
 
Example, skip `dotnet-trace`:
 
```bash
ansible-playbook -i inventory.ini playbook.yml \
  --extra-vars '{"dotnet_global_tools": ["dotnet-counters", "dotnet-dump"]}'
```
 
## Project structure
 
```
ansible-dotnet-macos-playbook/
├── Makefile
├── inventory.ini
├── playbook.yml
├── uninstall.yml
├── roles/
│   ├── dotnet/
│   │   ├── defaults/main.yml
│   │   └── tasks/main.yml
│   └── vscode/
│       ├── defaults/main.yml
│       └── tasks/main.yml
└── README.md
```
