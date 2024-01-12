{ pkgs, lib, ... }: {

  name = "{{stack}} Development Environment";

  # Enable devcontainer support
  # Note: features are not used and replaced by devenv
  devcontainer = {
    enable = true;
    settings = {
      customizations = {
        vscode = {
          settings = {
            # Standard
            update.showReleaseNotes = false;
            window.commandCenter = false;
            workbench.colorTheme = "GitHub Dark Default";
            workbench.preferredDarkColorTheme = "GitHub Dark Default";
            workbench.preferredLightColorTheme = "GitHub Light Default";
            workbench.preferredHighContrastColorTheme = "GitHub Dark High Contrast";
            workbench.preferredHighContrastLightColorTheme = "GitHub Light High Contrast";
            terminal.integrated.defaultProfile.linux = "zsh";
            editor.formatOnSave = true;
            editor.formatOnPaste = true;
            editor.minimap.autohide = true;
            vim.mouseSelectionGoesIntoVisualMode = false;
            asciidoc.antora.enableAntoraSupport = false;
            asciidoc.extensions.enableKroki = true;
            # Stack specific
            # ...
          };
          extensions = [
            # Standard
            "github.github-vscode-theme"
            "github.codespaces"
            "github.copilot"
            "github.copilot-chat"
            "asciidoctor.asciidoctor-vscode"
            "scodevim.vim"
            "mkhl.direnv"
            # Stack specific
            # ...
          ]; 
        };
        codespaces = {
          "openFiles" = [
            # Open README at launch
            "README.adoc"
          ];
        };
      };
      # Default port forwarding for applications
      # Remove if not used
      forwardPorts = [
        8501
      ];
      portsAttributes = {
        "8501" = {
          label = "Default";
          onAutoForward = "openPreview";
        };
      };
      # Capacity requested for devcontainer
      hostRequirements = {
        cpus = 2;
        memory = "8gb";
        storage = "32gb";
      };
      # Optional: Secret asked when starting the devcontainer
      secrets = {
        # NAME_OF_SECRET_1 = {
        #  description = "This is the description of the secret.";
        #  documentationUrl = "https://example.com/link/to/info";
        # };
        # NAME_OF_SECRET_2 = { };
      };
    };
  };

  # Enable starship for a better prompt
  # Will load a project starship.toml
  starship = {
    enable = true;
    config.enable = true;
  };

  # Common packages for developers
  difftastic.enable = true;
  packages = with pkgs; [ 
    # Standard
    curl
    git
    gh
    jq
    # Stack specific
  ] ++ lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
    # Rerquired for {{stack}} on darwin only
    # ...
  ]);

  # Toolchain: {{stack}}
  languages = {
    # {{stack}} = {
    #    enable = true;
    #    # options ...
    # };
  };

  # Pre-commit hooks: {{stack}}
  pre-commit.hooks = {
    # <hook>.enable = true;
  };

  # Additional services
  # Such as mongodb, potgres, mysql, redis, memcahed, minio, wiremock, ...
  services = {
    # {{service}} = {
    #    enable = true;
    #    # options ...
    # };
  };

  # Environment variables
  dotenv.enable = false;
  env = {
    DEVENV_STACK = "{{stack}}";
  };
 
  # Special hosts
  # Can be used to mock external attached resources
  hosts = {
    "locahost" = "127.0.0.1";
  };

  # Scripts: {{stack}}
  # Can be used as aliases, built your own lightsaber
  scripts = {
    # Install global addons
    setup.exec = ''
    '';
    # Workflow shortcuts
    init.exec = ''
    '';
    run.exec = ''
    '';
    build.exec = ''
    '';
    test.exec = ''
    '';
    clean.exec = ''
    ''; 
  };

  # Startup commands
  enterShell = ''
    clear
    echo "【ツ】Welcome to your {{stack}} Environment!"
    git --version
  '';

}
