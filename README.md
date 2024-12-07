# dotfiles

```bash
ln -s path/to/dotfiles/.config ~/.config
ln -s path/to/dotfiles/.zshrc ~/.zshrc
```

## Set the following system environment variables for Java configuration

```bash
export NVIM_JDK_ROOT_PATH=/Library/Java/JavaVirtualMachines

export NVIM_JDK_17_HOME=$NVIM_JDK_ROOT_PATH/graalvm-jdk-17.0.8+9.1/Contents/Home
export NVIM_JDK_21_HOME=$NVIM_JDK_ROOT_PATH/graalvm-jdk-21+35.1/Contents/Home

export NVIM_DEFAULT_JDK=$NVIM_JDK_21_HOME/bin/java

export JAVA_RUNTIMES="{
  \"JavaSE-17\":\"${NVIM_JDK_17_HOME}\",
  \"JavaSE-21\":\"${NVIM_JDK_21_HOME}\"
}"
```

## Set the following system environment variables for obsidian.nvim plugin configuration

```bash
OBSIDIAN_VAULT_NOAH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Noah's Vault"

export OBSIDIAN_VAULTS="{
  \"noah\":\"${OBSIDIAN_VAULT_NOAH}\"
}"
```
