local add = vim.pack.add

add({"https://github.com/GustavEikaas/easy-dotnet.nvim"})
require("easy-dotnet").setup()

-- Keymaps
local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

nmap_leader("rb", "<CMD>Dotnet build<CR>", "Dotnet build")
nmap_leader("rr", "<CMD>Dotnet run<CR>", "Dotnet run")


-- MiniFiles integration
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    vim.keymap.set("n", "<leader>a", function()
      local entry = require("mini.files").get_fs_entry()
      if entry == nil then
        vim.notify("No fd entry in mini files", vim.log.levels.WARN)
        return
      end
      local target_dir = entry.path
      if entry.fs_type == "file" then
        target_dir = vim.fn.fnamemodify(entry.path, ":h")
      end
      require("easy-dotnet").create_new_item(target_dir)
    end, { buffer = buf_id, desc = "Create file from dotnet template" })
  end,
})
