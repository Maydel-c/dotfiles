return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>m"] = {
            function()
              local filename = vim.fn.expand("%:t:r") -- file without extension
              local ext = vim.fn.expand("%:e")

              local targets = {}
              if ext == "h" or ext == "hpp" then
                targets = { filename .. ".cpp", filename .. ".cc" }
              elseif ext == "cpp" or ext == "cc" then
                targets = { filename .. ".h", filename .. ".hpp" }
              else
                vim.notify("Not a C++ source/header file", vim.log.levels.WARN)
                return
              end

              local found = nil
              for _, target in ipairs(targets) do
                local cmd = "fd --hidden --exclude .git ^" .. target .. "$"
                local handle = io.popen(cmd)
                if handle then
                  local result = handle:read("*l")
                  handle:close()
                  if result and vim.fn.filereadable(result) == 1 then
                    found = result
                    break
                  end
                end
              end

              if found then
                vim.cmd("vsplit " .. found)
              else
                vim.notify("No matching file found", vim.log.levels.WARN)
              end
            end,
            desc = "Open matching .cpp/.h file anywhere in project",
          },
        },
      },
    },
  },
}
