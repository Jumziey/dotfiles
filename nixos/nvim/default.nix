{ config, pkgs, lib, ... }:
let
  angular-language-server = pkgs.mkYarnPackage {
    name = "angular-language-server";
    pname = "@angular/language-server";
    src = pkgs.fetchFromGitHub {
      owner = "jumziey";
      repo = "vscode-ng-language-service";
      rev = "6d66f973ba1ffc27fad574111d19ab58ecddd476";
      sha256 = "1swip9h9hl3xqjs5ddrxkbdv4q5ssq6k2ljp9il7mvffif4q6hd0";
    };
  };

  custom-hop-vim = pkgs.vimUtils.buildVimPlugin {
    name = "hop-vim";
    src = pkgs.fetchFromGitHub {
      owner = "phaazon";
      repo = "hop.vim";
      rev = "e2f978b50c2bd9ae2c6a4ebdf2222c0f299c85c3";
      sha256 = "1si2ibxidjn0l565vhr77949s16yjv46alq145b19h15amwgq3g2";
    };
  };

  material-vim = pkgs.vimUtils.buildVimPlugin {
    name = "material.vim";
    src = pkgs.fetchFromGitHub {
      owner = "kaicataldo";
      repo = "material.vim";
      rev = "7dfa4bbf1fe43fcebcd836ef4f3b1342b4ea69be";
      sha256 = "1ihakmh07j47rzy76242zbipcgdn4yh5bivz09469hr1jj2snyj3";
    };
  };

  open-browser-vim = pkgs.vimUtils.buildVimPlugin {
    name = "open-browser.vim";
    src = pkgs.fetchFromGitHub {
      owner = "tyru";
      repo = "open-browser.vim";
      rev = "d6f1784685abdd86500fdb5fa2fbaf2aab833f18";
      sha256 = "1akgsq1v9v5klm995y09zmka0hbfsa0gr44gyp2nvqi9ggfadp0k";
    };
    configurePhase = ''
      rm Makefile
    '';
  };

  plantuml-previewer-vim = pkgs.vimUtils.buildVimPlugin {
    name = "plantuml-previewer.vim";
    src = pkgs.fetchFromGitHub {
      owner = "Jumziey";
      repo = "plantuml-previewer.vim";
      rev = "91d9071b9f500faf2be9bb46ad5727f4d53ecba7";
      sha256 = "0z4gv5ykwlihf6fr1zdw090l4q7ncnyhn0pyf1wk7bj35fn0a5bf";
    };
  };

  graphviz-vim = pkgs.vimUtils.buildVimPlugin {
    name = "graphviz.vim";
    src = pkgs.fetchFromGitHub {
      owner = "jumziey";
      repo = "graphviz.vim";
      rev = "5693e431ab81801710b71d1c5dc726f7336a9c0e";
      sha256 = "14g5z9v9xzwjwvc1i2j0h7zlfjvqw4zx6qn0czqrv2mykspjd4s1";
    };
  };

  vim-godot = pkgs.vimUtils.buildVimPlugin {
    name = "vim-godot";
    src = pkgs.fetchFromGitHub {
      owner = "habamax";
      repo = "vim-godot";
      rev = "326ee7e3c5162a2aa22617f1e0b74ee6d4b4a567";
      sha256 = "0w8v21w5330v29krhhnbzy20rvvkqbv0gk11rzbgm9ggc2i1yp3c";
    };
  };

  spelunker-vim = pkgs.vimUtils.buildVimPlugin
    {
      name = "spelunker.vim";
      src = pkgs.fetchFromGitHub {
        owner = "kamykn";
        repo = "spelunker.vim";
        rev = "a0bc530f62798bbe053905555a4aa9ed713485eb";
        sha256 = "0c9r75abf7blzmadpnz79m3clr62xyxh1ifyirhv5yirlpc0slzz";
      };
    };

  nvim-cmp-local = pkgs.vimUtils.buildVimPlugin
    {
      name = "nvim-cmp";
      src = pkgs.fetchFromGitHub {
        owner = "hrsh7th";
        repo = "nvim-cmp";
        rev = "9bb8ee6e2d6ab3c8cc53323b79f05886bc722faa";
        sha256 = "1z7b53yxamph255rvrs5a4pq5hbqa0nbwpdh1xy8fvfc71gap80n";
      };
      configurePhase = ''
        rm Makefile
      '';
    };
  cmp-nvim-lsp-local = pkgs.vimUtils.buildVimPlugin
    {
      name = "cmp-nvim-lsp";
      src = pkgs.fetchFromGitHub {
        owner = "hrsh7th";
        repo = "cmp-nvim-lsp";
        rev = "78924d1d677b29b3d1fe429864185341724ee5a2";
        sha256 = "1gzn4v70wa61yyw9vfxb8m8kkabz0p35nja1l26cfhl71pnkqrka";
      };
    };

  # TODO: add linters
  neomake-jumziey-vim = pkgs.vimUtils.buildVimPlugin {
    name = "neomake";
    src = pkgs.fetchFromGitHub {
      owner = "jumziey";
      repo = "neomake";
      rev = "eba1b807d47f75a43c5c9792eeeb9f294e831b7f";
      sha256 = "15l8jihycc2c2dxz0w39b8qbspr0qjpyzmlbg4hg1rdprnf88dsw";
    };
    configurePhase = ''
      rm Makefile
    '';
  };

  local-plugin = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "local-plugin";
    src = ./local-plugin;
  };

in
{
  environment.systemPackages = with pkgs;
    [
      neovim
      sumneko-lua-language-server
      yaml-language-server
      jdt-language-server
      gopls
      terraform-ls
      nodePackages.typescript-language-server
      cmake-language-server 
      golangci-lint
      golint
      godef
      gotools
      angular-language-server
      rnix-lsp
    ];

  programs.neovim = {
    enable = true;
    #package = neovim-nightly-overlay.neovim;
    defaultEditor = true;
  };

  nixpkgs.overlays = [
    (self: super: {
      jdt-language-server = pkgs.callPackage ./custom-pkgs/jdt-language-server.nix { 
        jdk17 = pkgs.jdk17;
      };
    })
    (self: super: {
      neovim = super.neovim.override {
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [
              # fuzzy finder on stereoids
              fzf-vim

              # status bar
              vim-airline
              vim-airline-themes

              # jump in text easily, easymotion style
              custom-hop-vim

              # Gives git status per line
              gitgutter

              # Best git manager evah
              fugitive
              fugitive-gitlab-vim
              # Gives g push asynch to fugitive
              #vim-dispatch-neovim

              #Latex integration
              vimtex

              # Theme
              vim-hybrid-material

              # formatter
              neoformat

              # haskell
              haskell-vim
              intero-neovim

              # markdown
              #markdown-preview-nvim

              # Bats 
              bats-vim

              # Personal notes
              vimwiki

              #vimscript

              # vimscript testing
              vader-vim

              # PlantUML
              plantuml-syntax

              # global test plugin
              vim-test

              # nix plugin
              vim-nix

              #theme
              material-vim

              #plantuml
              open-browser-vim
              plantuml-previewer-vim

              # graphviz
              graphviz-vim

              # godot
              vim-godot

              # spelling
              spelunker-vim

              # Used for after/ftplugin spell and syntax
              local-plugin


              nvim-lspconfig
              # nvim-cmp # Autocompletion
              nvim-cmp-local
              cmp-nvim-lsp-local

              neomake-jumziey-vim

              (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))

              nvim-jdtls

              dashboard-nvim

              vim-projectionist

              UltiSnips

              vim-helm
            ];
            opt = [ ];
          };
          customRC = builtins.concatStringsSep "\n" [
            # Global
            (lib.strings.fileContents ./default.vim)
            (lib.strings.fileContents ./theme.vim)

            # file type detection
            (lib.strings.fileContents ./ftdetect.vim)

            # Plugins
            (lib.strings.fileContents ./plugins/airline.vim)
            (lib.strings.fileContents ./plugins/gitgutter.vim)
            (lib.strings.fileContents ./plugins/hop.vim)
            (lib.strings.fileContents ./plugins/netrw.vim)
            (lib.strings.fileContents ./plugins/vimtex.vim)
            (lib.strings.fileContents ./plugins/neomake.vim)
            (lib.strings.fileContents ./plugins/neoformat.vim)
            (lib.strings.fileContents ./plugins/vimwiki.vim)
            (lib.strings.fileContents ./plugins/vim-test.vim)
            (lib.strings.fileContents ./plugins/spelunker.vim)
            (lib.strings.fileContents ./plugins/fzf.vim)
            (lib.strings.fileContents ./plugins/vim-go.vim)
            (lib.strings.fileContents ./plugins/plantuml-previewer.vim)
            ''
              lua << EOF
              ${lib.strings.fileContents ./plugins/lspconfig.lua}
              ${lib.strings.fileContents ./plugins/cmp.lua}
              ${lib.strings.fileContents ./plugins/dashboard.lua}
              ${lib.strings.fileContents ./plugins/treesitter.lua}
              EOF
            ''
          ];
        };
      };
    })
  ];
}
