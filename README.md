# Unreal Engine Entry Creator

This script creates a `.desktop` entry for Unreal Engine, making it accessible from the application menu on Linux distributions.

## Description

The script automates the process of creating a desktop application entry for Unreal Engine on Linux. It prompts the user for several details to customize the entry.

### Features:

-   Prompts for the Unreal Engine installation path.
-   Optionally converts the default `.bmp` icon to `.png` using ImageMagick (necessary on GNOME).
-   Allows using a custom name for the application entry based on the installation directory.
-   Creates a `unreal-engine.desktop` file in `~/.local/share/applications/`.

## Prerequisites

-   A Linux-based operating system.
-   Unreal Engine installed.
-   **ImageMagick** (optional): Required only if you choose to convert the icon. You can typically install it via your distribution's package manager (e.g., `sudo apt install imagemagick` on Debian/Ubuntu).

## Usage

1.  **Make the script executable:**
    ```bash
    chmod +x unreal-engine-entry-creator.sh
    ```

2.  **Run the script:**
    ```bash
    ./unreal-engine-entry-creator.sh
    ```

3.  **Follow the prompts:**
    -   **Enter the Unreal Engine installation path**: Provide the full path to your Unreal Engine installation directory (e.g., `/home/user/Games/UE_5.4`).
    -   **Force icon conversion**: Answer `y` if you want to convert the icon from `.bmp` to `.png`. This is recommended for Gnome.
    -   **Use path as name**: Answer `y` if you want the application menu entry to be named after the installation folder (e.g., `UE_5.4`). Otherwise, it will be named "Unreal Engine".

After the script finishes, you should be able to find the Unreal Engine entry in your application menu.


