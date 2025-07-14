{pkgs, config, lib, ...}:
{
  imports = [ ];
  options = {
    vim.enable = lib.mkEnableOption "Enables vim config";
  };

  config = lib.mkIf config.vim.enable {
    home-manager.sharedModules = [
      {
        programs.vim = {
          enable = true;
          # plugins = with pkgs.vimPlugins; [ ];
          settings = {
            expandtab = true;
            relativenumber = true;
            number = true;
            tabstop = 2;
            shiftwidth = 2;
          };
          extraConfig = ''
            set autoindent
          '';
        };
      }
    ];
  };
}
