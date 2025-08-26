# 🚀 My Neovim Configuration

This Neovim configuration is a personalized setup tailored to my development workflow. It's based on work by [Josean Martinez's Neovim series](https://www.youtube.com/watch?v=6pAG3BHurdM&ab_channel=JoseanMartinez).

---

## ✨ Some Additional Features and Information

- **LSP & Linting**: Integrated Language Server Protocol (LSP) and linting support for:
  - C
  - C++
  - Python
- **VS Code-style Integrated Terminal**: A terminal that can be easily toggled with `<C-j>` (**Ctrl + J**) for quick access to your shell powered by `akinsho/toggleterm.nvim`.
- **Leader Key**: The **`Spacebar`** acts as the leader key. Press it in normal mode to easily view and navigate available keybindings, powered by `folke/which-key.nvim`.

---

## 🛠️ Installation

### 1. Install Prerequisites 📦

Before installing this configuration, you need to have the following installed on your system:

- **`npm`** (Node Package Manager)
- **`nodejs`**
- **`ripgrep`** (critical for `telescope.nvim` to function efficiently)
- **`lazygit`**
- And obviously don't forget to install neovim 😜

#### For Linux 🐧

Follow the instructions specific to your Debian-based or Fedora-based distribution:

- **Debian/Ubuntu (using `apt`)**

  ```bash
  sudo apt update
  sudo apt install -y npm nodejs ripgrep lazygit
  ```

- **Fedora (using `dnf`)**
  ```bash
  sudo dnf install -y npm nodejs ripgrep lazygit
  ```

#### For macOS 🍎

```bash
brew install node npm ripgrep lazygit
```

### 2. ⚡ Installation Command

To install this Neovim configuration, run the following command in your terminal. This command will:

- Remove any existing ~/.config/nvim directory (ensuring a clean installation).

- Clone this repository's contents directly into ~/.config/nvim.

```bash
rm -rf ~/.config/nvim && git clone --depth 1 https://github.com/sthitapati/nvim-config-folder.git ~/.config/nvim
```
