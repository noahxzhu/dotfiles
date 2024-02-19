export NVIM_JDK_ROOT_PATH=/Library/Java/JavaVirtualMachines

export NVIM_JDK_17_HOME=$NVIM_JDK_ROOT_PATH/graalvm-jdk-17.0.8+9.1/Contents/Home
export NVIM_JDK_21_HOME=$NVIM_JDK_ROOT_PATH/graalvm-jdk-21+35.1/Contents/Home

export NVIM_DEFAULT_JDK=$NVIM_JDK_21_HOME/bin/java

export JAVA_RUNTIMES="{
  \"JavaSE-17\":\"${NVIM_JDK_17_HOME}\",
  \"JavaSE-21\":\"${NVIM_JDK_21_HOME}\"
}"


# Obsidian settings
export OBSIDIAN_VAULT_NOAH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Noah's Vault"

# Add multiple vaults if you need
export OBSIDIAN_VAULTS="{
  \"noah\":\"${OBSIDIAN_VAULT_NOAH}\"
}"

