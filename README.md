<img width="1680" alt="image" src="https://github.com/user-attachments/assets/28843e7c-96a1-4439-8cf5-c407b8ecf336" /># My macOS Configuration

This repository contains my personal configuration files for macOS, aimed at creating a productive and efficient development environment. It includes configurations for window management, hotkeys, status bar customization, text editing, and system information display.

<img width="1680" alt="image" src="https://github.com/user-attachments/assets/8a7c6764-9845-46ee-a3ac-75d7ca114e2a" />

## Key Components

* [**yabai**](https://github.com/koekeishiya/yabai): A tiling window manager for macOS. It allows you to control your windows with keyboard shortcuts, improving workflow and productivity.

* [**skhd**](https://github.com/koekeishiya/skhd): A simple hotkey daemon for macOS. It's used to define custom keyboard shortcuts for controlling yabai and other applications.

* [**SketchyBar**](https://github.com/Felix-Haeberle/SketchyBar): A highly customizable status bar for macOS. It replaces the default menu bar and can display various information and widgets.

* [**Neovim (nvim)**](https://neovim.io/): A highly extensible and configurable text editor. My configuration provides a powerful and streamlined coding experience.

* [**fastfetch**](https://github.com/fastfetch-org/fastfetch): A system information tool that displays system details in the terminal.

## Installation and Setup

### Prerequisites

* **macOS:** This configuration is designed for macOS.

* **Homebrew:** I recommend using Homebrew to install the necessary dependencies. If you don't have it, install it from <https://brew.sh/>.

* **Git:** Git is required to clone this repository and manage dotfiles.

### Installation Steps

1.  **Clone the repository:**

    ```
    git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git) ~/.dotfiles
    ```

    *Replace `your-username/your-repo-name` with the actual name of your repository.*
    *Cloning to `~/.dotfiles` is a common convention, but you can choose a different location if you prefer.*

2.  **Install dependencies using Homebrew:**

    ```
    brew install yabai skhd sketchybar neovim fastfetch
    #  Any other dependencies you have, for example:
    # brew install --cask alacritty
    ```

3.  **Set up Neovim:**

    * If you have a `init.vim`, back it up.

    * Create the neovim config directory and symlink:

        ```
        mkdir -p ~/.config/nvim
        ln -s ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
        ```

4.  **Set up Yabai and SKHD:**

    * Create the required directories:

        ```
        mkdir -p ~/.config/yabai
        mkdir -p ~/.config/skhd
        ```

    * Link the configuration files:

        ```
        ln -s ~/.dotfiles/yabai/.yabairc ~/.config/yabai/.yabairc
        ln -s ~/.dotfiles/skhd/.skhdrc ~/.config/skhd/.skhdrc
        ```

    * Make yabai configuration executable:

        ```
        chmod +x ~/.config/yabai/.yabairc
        ```

5.  **Set up SketchyBar:**

    * Link the configuration file:

        ```
        mkdir -p ~/.config/sketchybar
        ln -s ~/.dotfiles/sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
        ```

6.  **Set up Fastfetch (Optional):**

    * If you have a fastfetch config, back it up.

    * Create the fastfetch config directory:

        ```
        mkdir -p ~/.config/fastfetch
        ```

    * Link the configuration

        ```
        ln -s ~/.dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
        ```

7.  **Additional steps:**

    * Some of the tools might require additional setup, such as installing plugins for Neovim. Refer to the specific configuration files and their respective documentation for any further instructions.

    * You might need to adjust file permissions for some configuration files to ensure they are readable and executable.

## Configuration Details

### yabai

* Tiling window management with focus on keyboard control.

* Custom layouts and space management.

* See `~/.config/yabai/.yabairc` for specific settings.

### skhd

* Keyboard shortcuts for window management, application launching, and other system-wide actions.

* See `~/.config/skhd/.skhdrc` for defined hotkeys.

### SketchyBar

* Custom status bar replacing the default macOS menu bar.

* Displays system information, application statuses, and custom widgets.

* See `~/.config/sketchybar/sketchybarrc` for bar configuration.

### Neovim

* Highly customized Neovim configuration for efficient code editing.

* Includes plugins, custom settings, and key mappings.

* See `~/.config/nvim/init.lua` for the main configuration file.

### fastfetch

* Displays system information in the terminal, such as OS, hostname, kernel version, and installed packages.

* See `~/.config/fastfetch/config.jsonc` for configuration.

## Usage

* **yabai:** Use the keyboard shortcuts defined in `~/.config/skhd/.skhdrc` to manage windows and spaces.

* **skhd:** The hotkeys defined in `~/.config/skhd/.skhdrc` are automatically active.

* **SketchyBar:** The custom status bar will replace the default menu bar upon login or restarting SketchyBar.

* **Neovim:** Open Neovim in the terminal using the `nvim` command.

* **fastfetch:** Run `fastfetch` in the terminal to display system information.

## Customization

Feel free to fork this repository and customize the configuration files to suit your own preferences. Here are some common customization tasks:

* **yabai:** Modify the `~/.config/yabai/.yabairc` file to change the window layout, gaps, and other settings.

* **skhd:** Edit the `~/.config/skhd/.skhdrc` file to change or add keyboard shortcuts.

* **SketchyBar:** Customize the `~/.config/sketchybar/sketchybarrc` file to change the appearance and content of the status bar.

* **Neovim:** Modify the `~/.config/nvim/init.lua` file to change editor settings, install plugins, and configure key mappings.

* **fastfetch:** Edit the `~/.config/fastfetch/config.jsonc` to change what system information is displayed.

## Important Notes

* **Backup:** Before making any changes to your system configuration, it's highly recommended to back up your existing configuration files.

* **Dependencies:** Ensure that you have all the necessary dependencies installed before using these configuration files.

* **Compatibility:** These configurations are primarily tested on specific macOS versions. Compatibility with other versions may vary.

* **Updates:** I recommend keeping your tools (yabai, skhd, etc.) updated to the latest versions to ensure compatibility and security.

* **Dotfile Management:** Consider using a dotfile manager (e.g., [chezmoi](https://chezmoi.io/), [dotbot](https://github.com/anishathalye/dotbot)) to manage your configuration files more effectively. This can help with syncing your configuration across multiple machines and keeping track of changes.
