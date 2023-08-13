# dotfiles

```
ln -s path/to/dotfiles/.config ~/.config
ln -s path/to/dotfiles/.zshrc ~/.zshrc
ln -s path/to/dotfiles/.tmux.conf ~/.tmux.conf
```

## Set the following system environment variables for Java configuration

```
export NVIM_JDK_ROOT_PATH=/Library/Java/JavaVirtualMachines
export NVIM_JDK_17_HOME=$NVIM_JDK_ROOT_PATH/graalvm-ce-java17-22.3.1/Contents/Home
export NVIM_DEFAULT_JDK=$NVIM_JDK_17_HOME/bin/java
```
