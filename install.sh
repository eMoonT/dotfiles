#bin/sh
#
# author: eMoon
# date:   2024-01-02
#

alacritty_config=/home/emoon/.config/alacritty/alacritty.toml
zshrc_config=/home/emoon/.zshrc
starship_config=/home/emoon/.config/starship.toml
tmux_config_dir=/home/emoon/.tmux
dwm_config_dir=/home/emoon/Documents/dwm_tag_hide
slock_config_dir=/home/emoon/Documents/slock
rofi_config=/home/emoon/.config/rofi
ranger_config=/home/emoon/.config/ranger
picom_config=/home/emoon/.config/picom/picom.conf
dunst_config_dir=/home/emoon/.config/dunst/dunstrc
xinitrc_config=/home/emoon/.xinitrc
xprofile_config=/home/emoon/.xprofile
fzf_config_dir=/home/emoon/.fzf /home/emoon/.fzf.zsh /home/emoon/.fzf.bash
scripts_dir=/home/emoon/scripts


#base_package() {
#  paru -S ly neovim nvui dunst ranger rofi tmux starship zsh alacritty picom-jonaburg-git tlp tlp-rwd tlpui feh amixer acpi acpitool xorg-xbacklight trayer
#  mv ~/.config/nvim ~/.config/nvim.bak
#  mv ~/.local/share/nvim ~/.local/share/nvim.bak
#  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
#}

backup_dir="/home/emoon/dotfiles"

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Copy files and directories to the backup directory
cp "$alacritty_config" "$backup_dir"
cp "$zshrc_config" "$backup_dir"
cp "$starship_config" "$backup_dir"
cp -r "$tmux_config_dir" "$backup_dir"
cp -r "$dwm_config_dir" "$backup_dir"
cp -r "$slock_config_dir" "$backup_dir"
cp -r "$rofi_config" "$backup_dir"
cp -r "$ranger_config" "$backup_dir"
cp "$picom_config" "$backup_dir"
cp "$dunst_config_dir" "$backup_dir"
cp "$xinitrc_config" "$backup_dir"
cp "$xprofile_config" "$backup_dir"
cp -r "$fzf_config_dir" "$backup_dir"
cp -r "$scripts_dir" "$backup_dir"

echo "Files copied to $backup_dir"

# git init
[ -d $backup_dir ] && cd $backup_dir

git init
git add .
git commit -m 'Update: New Config'
git branch -M main
git remote add origin https://github.com/eMoonT/dotfiles.git
git push origin main

#[ echo $? -eq 0 ] && rm -rf $backup_dir
#rm -rf $backup_dir

