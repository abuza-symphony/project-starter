# MacOS Setup Workstation Guide

Follow this guide to set up your development environment on macOS.

## 1. Clone the Git Repository

Use the following command to clone the repository to your local machine:

```bash
git clone <repository_url>
```

Replace `<repository_url>` with the URL of your git repository. Then navigate to the repository directory:

```bash
cd <repository_name>
```

## 2. Install macOS System Dependencies

Ensure you have [Homebrew](https://brew.sh/) installed. If not, install it with:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once Homebrew is set up, install the required dependencies:

```bash
brew install python@3 pipx curl git mise gcc
```

- `python@3`: Provides Python 3 for your system.
- `pipx`: A tool to run and install Python applications in isolated environments.
- `curl`: A command-line tool for transferring data using various protocols.
- `git`: Distributed version control system.
- `mise`: Polyglot runtime manager (asdf rust clone).
- `gcc`: GNU compiler collection

## 3. Run Mise Setup

Configure the project using the mise tool:

```bash
mise trust
mise install
echo 'eval "$(/opt/homebrew/bin/mise activate zsh)"' >> $HOME/.zshrc
. $HOME/.zshrc
mise use -g rust@stable
mise run install
```

If you are using `zsh-completions` add the following to your `.zshrc`:

```bash
autoload -U compinit promptinit && promptinit && compinit
```

This installs project-specific dependencies and configures your environment.

## 4. Restart/Open the Project in VS Code

Restart or open the project directory in VS Code:

```bash
code .
```

If `code` isn’t recognized, add it to your `$PATH`.

## 5. Happy Coding
