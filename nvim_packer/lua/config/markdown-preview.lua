

local status, markdown = pcall(require, "markdown-preview")
if not status then
    vim.notify("markdown-preview not found!")
  return
end

-- nmap <C-gcc

local opts = {

}

markdown.setup(opts)
