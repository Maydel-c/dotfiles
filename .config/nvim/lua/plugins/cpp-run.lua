return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.mappings = opts.mappings or {}
      opts.mappings.n = opts.mappings.n or {}

      opts.mappings.n["<leader>r"] = {
        function()
          local file = vim.fn.expand("%:p")
          local dir = vim.fn.expand("%:p:h")
          local build_dir = dir .. "/build"
          local output = build_dir .. "/main"

          -- ensure build directory exists
          vim.fn.mkdir(build_dir, "p")

          -- compile + run in terminal
          vim.cmd("split | terminal g++ -std=c++17 -O2 -Wall "
            .. file
            .. " -o "
            .. output
            .. " && "
            .. output)
        end,
        desc = "Compile & Run C++ (build/main)",
      }

      return opts
    end,
  },
}
