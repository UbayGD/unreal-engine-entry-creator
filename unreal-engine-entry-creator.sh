#!/bin/bash
# Script for creating a entry for Unreal Engine in the application menu

# Ask for Unreal Engine installation path
read -p "Enter the Unreal Engine installation path (e.g., /opt/UnrealEngine): " UE_PATH

# Check if the path exists
if [ ! -d "$UE_PATH" ]; then
    echo "The specified path does not exist. Please check and try again."
    exit 1
fi

# Ask if the user wants to force the icon conversion
read -p "Do you want to force the icon conversion from BMP to PNG? (y/n): " FORCE_ICON_CONVERSION

if [ "$FORCE_ICON_CONVERSION" == "y" ]; then
    echo "Forcing icon conversion..."

    # Check if ImageMagick is installed
    if ! command -v magick &> /dev/null; then
        echo "ImageMagick is not installed. Please install it and try again."
        exit 1
    fi

    # Convert BMP icon to PNG
    ICON_BMP="$UE_PATH/Engine/Content/Splash/IconDefault.bmp"
    ICON_PNG="$UE_PATH/Engine/Content/Splash/IconDefault.png"

    if [ -f "$ICON_BMP" ]; then
        magick "$ICON_BMP" "$ICON_PNG"
    else
        echo "Icon file not found at $ICON_BMP. Please check the path."
        exit 1
    fi
else
    echo "Skipping icon conversion."
fi

# Ask for use UE_PATH as name in the menu
read -p "Do you want to use the Unreal Engine installation path as the name in the menu? It will use the last subdirectory (current: $(basename "$UE_PATH")) (y/n): " USE_PATH_AS_NAME

BASENAME_PATH=$(basename "$UE_PATH")

# Create the .desktop file
cat <<EOF > ~/.local/share/applications/unreal-engine.desktop
[Desktop Entry]
Name=$(if [ "$USE_PATH_AS_NAME" == "y" ]; then echo "$BASENAME_PATH"; else echo "Unreal Engine"; fi)
Comment=$(if [ "$USE_PATH_AS_NAME" == "y" ]; then echo "$BASENAME_PATH"; else echo "Unreal Engine"; fi)
Keywords=Unreal; Unreal Engine; unreal; engine;
Exec=$UE_PATH/Engine/Binaries/Linux/UnrealEditor
Icon=$(if [ -f "$ICON_PNG" ]; then echo "$ICON_PNG"; else echo "$ICON_BMP"; fi)
StartupWMClass=UnrealEditor
Terminal=false
Type=Application
Categories=Development
EOF

echo "Unreal Engine entry created successfully!"