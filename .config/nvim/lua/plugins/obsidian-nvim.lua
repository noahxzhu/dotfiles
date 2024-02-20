local workspaces = {}

local vaults_json = vim.env.OBSIDIAN_VAULTS
if vaults_json then
  local vaults_table = vim.fn.json_decode(vaults_json)
  if vaults_table then
    for name, path in pairs(vaults_table) do
      table.insert(workspaces, { name = name, path = path })
    end
  end
end

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = "markdown",
  keys = {
    {
      "<leader>co",
      ft = "markdown",
      "<cmd>ObsidianOpen<cr>",
      desc = "Open Obsidian",
    },
  },
  opts = {
    workspaces = workspaces,
    ui = {
      enable = false,
    },
  },
}
