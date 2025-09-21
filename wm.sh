git clone https://github.com/fakhrulnugroho/i3
git clone https://github.com/fakhrulnugroho/polybar
git clone https://github.com/fakhrulnugroho/rofi

#!/bin/bash

# daftar folder yang mau di-backup
folders=("i3" "polybar" "rofi")

# lokasi config (umumnya di ~/.config)
config_dir="$HOME/.config"

for folder in "${folders[@]}"; do
    src="$config_dir/$folder"
    backup="$config_dir/${folder}.old"

    if [ -d "$src" ]; then
        # kalau sudah ada backup lama, hapus dulu
        if [ -d "$backup" ]; then
            rm -rf "$backup"
        fi
        mv "$src" "$backup"
    else
        echo "Folder $src tidak ada, skip..."
    fi
done

cp -r "./i3" "$config_dir"
cp -r "./polybar" "$config_dir"
cp -r "./rofi" "$config_dir"
