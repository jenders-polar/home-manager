{ ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
    globals.mapleader = " ";
    globals.loaded_netrwPlugin = 1;
    globals.loaded_netrw = 1;
    opts = {
      number = true;
      relativenumber = true;
      list = true;
      tabstop = 2;
      shiftwidth = 2;
      foldmethod = "manual";
    };

    keymaps = [
      {
        action = "<cmd>DapToggleBreakpoint<CR>";
        key = "<Leader>db";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<Leader>ff";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<Leader>fb";
      }
      {
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
        key = "<Leader>fz";
      }
      {
        action = "<cmd>Neotree float<CR>";
        key = "<Leader>e";
      }
    ];

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      fidget.enable = true;
      luasnip.enable = true;
      trouble.enable = true;
      web-devicons.enable = true;
      hex.enable = true;
      telescope.enable = true;
      precognition.enable = true;

      neo-tree = {
        enable = true;
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };

      lsp-format.enable = true;
      lsp-lines.enable = true;
      lsp-status.enable = true;

      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          nixd = {
            enable = true;
            onAttach.function = ''
              							require("lsp-format").on_attach(client, bufnr)
              						'';
          };
          zls = {
            enable = true;
            packageFallback = true;
            # package = nixpkgs-ddogfoodd.legacyPackages.${"x86_64-linux"}.zls;
          };
          rust_analyzer = {
            enable = true;
            packageFallback = true;
            installRustc = false;
            installCargo = false;
            onAttach.function = ''
              							require("lsp-format").on_attach(client, bufnr)
              						'';
          };
          gopls = {
            enable = true;
            onAttach.function = ''
              							require("lsp-format").on_attach(client, bufnr)
              						'';
          };
          ts_ls.enable = true;
          eslint.enable = true;
          tailwindcss.enable = true;
          html = {
            enable = true;
            filetypes = [ "html" ];
          };
          svelte = {
            enable = true;
            onAttach.function = ''
              							require("lsp-format").on_attach(client, bufnr)
              						'';
          };
          lua_ls = {
            enable = true;
          };
        };

        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
          gr = "rename";
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand = ''
            						function(args)
            							require('luasnip').lsp_expand(args.body)
            						end
            					'';
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };
    };
  };
}
