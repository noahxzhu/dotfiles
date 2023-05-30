local M = {}

-- icons used by other plugins
M.icons = {
  dap = {
    Stopped = { "󰁕 ", "DiagnosticSignWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticSignError" },
    LogPoint = ".>",
  },
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
  git = {
    Added = " ",
    Modified = " ",
    Removed = " ",
    LineAdded = " ",
    LineModified = " ",
    LineRemoved = " ",
    FileDeleted = " ",
    FileIgnored = "◌ ",
    FileRenamed = "➜ ",
    FileStaged = "S ",
    FileUnmerged = " ",
    FileUnstaged = " ",
    FileUntracked = "U ",
    Diff = " ",
    Repo = " ",
    Octoface = " ",
    Branch = " ",
  },
  kinds = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
  },
  ui = {
    ArrowCircleDown = " ",
    ArrowCircleLeft = " ",
    ArrowCircleRight = " ",
    ArrowCircleUp = " ",
    BoldArrowDown = " ",
    BoldArrowLeft = " ",
    BoldArrowRight = " ",
    BoldArrowUp = " ",
    BoldClose = " ",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BookMark = "",
    BoxChecked = "",
    Bug = "",
    Stacks = " ",
    Scopes = " ",
    Watches = "󰂥 ",
    DebugConsole = " ",
    Calendar = " ",
    Check = " ",
    ChevronRight = "> ",
    ChevronShortDown = " ",
    ChevronShortLeft = " ",
    ChevronShortRight = " ",
    ChevronShortUp = " ",
    Circle = " ",
    Close = "󰅖 ",
    CloudDownload = " ",
    Code = " ",
    Comment = " ",
    Dashboard = " ",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "» ",
    Ellipsis = "… ",
    EmptyFolder = " ",
    EmptyFolderOpen = " ",
    File = " ",
    FileSymlink = " ",
    Files = " ",
    FindFile = " ",
    FindText = "󰊄 ",
    Fire = " ",
    Folder = "󰉋 ",
    FolderOpen = " ",
    FolderSymlink = " ",
    Forward = " ",
    Gear = " ",
    Gears = " ",
    History = " ",
    Lazy = "󰒲 ",
    Lightbulb = " ",
    LineLeft = "▏",
    LineMiddle = "│",
    List = " ",
    Lock = " ",
    NewFile = " ",
    Note = " ",
    Package = " ",
    Pencil = "󰏫 ",
    Plus = " ",
    Project = " ",
    Search = " ",
    SignIn = " ",
    SignOut = " ",
    SlashSeparatorBack = "",
    SlashSeparatorForward = "",
    Tab = " ",
    Table = " ",
    Target = " ",
    Telescope = " ",
    Text = " ",
    Tree = " ",
    Triangle = "󰐊",
    TriangleLowerLeft = "",
    TriangleLowerRight = "",
    TriangleShortArrowDown = " ",
    TriangleShortArrowLeft = " ",
    TriangleShortArrowRight = " ",
    TriangleShortArrowUp = " ",
  },
}

return M
