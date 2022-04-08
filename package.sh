#!/bin/sh

which realpath >/dev/null || exit 2
which zip >/dev/null || exit 3

cd "$(realpath "${0%/*}")"/..
zip -9 -ru oUF_Hiui.zip oUF_Hiui -x "oUF_Hiui/textures/testing/*" -x "oUF_Hiui/.git/*" -x "oUF_Hiui/.vscode/*" -x "oUF_Hiui/.gitignore"
