# Manjaro Install steps

## Steps taken after Install
- Update packages
- Set `nouveau.nomodeset=0` so that I can install bumblebee driver
- Install bumblebee
- Test that resetting works
- Adjust kernel settings to enable airplane mode (to fix sleep bug): https://askubuntu.com/questions/1068054/18-04-msi-gs65-wifi-hardware-switch-disabled-after-suspend
	- sudo nvim /etc/default/grub
	- `GRUB_CMDLINE_LINUX_DEFAULT="acpi_osi=! acpi_osi='Windows 2009' quiet splash"`
	- `sudo update-grub`
- Install google-chrome from aur: `yay -S google-chrome`
	- Set up 1password
	- Download *linuxConfig* repository
 - Make symbolic links for files in linuxConfig repo
	 - compton
	 - .config/nvim (should only do this for init.vim)
	 - .config/termite
	- .scripts
	- .xprofile
- [ ] Configure *i3*
## Software Installed
- neovim
	- `yay -S neovim`
	- Set up link for config to ~/.config/nvim
	- Start up nvim and run :PlugInstall
	- Restart nvim, and all should be working
- [x] oh-my-zsh (already installed)
	- [x] powerlevel10k theme: `git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`
	- [x] autojump: `yay -S autojump`
	- [x] powerline fonts
		- install nerd fonts: `yay -S  nerd-fonts-complete`
		- install
- [x]xcape: `yay -S xcape`
	- Source to .xprofile: `setxkbmap -option caps:super -variant altgr-intl && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &`
- [x]lsd: `yay -S lsd`
- [x]ack: `yay -S ack`
- [x]trash: `yay -S trash-cli`
- [x]termite: `yay -S termite`
- [x]thefuck: `yay -S thefuck`
- []: ticktick
- []: notion
- [x] Redshift
	- `yay -S redshift`
	- Install geoclue: `yay -S geoclue`
	- Edit geoclue.conf: `v /etc/geoclue/geoclue.conf`:
		```
		[redshift]
		allowed=true
		system=false
		users=
		```
	- Add to i3 config:
		```
		### Redshift light flux
		exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent
		exec --no-startup-id redshift-gtk
		```
- [x] vifm: `yay -S vifm`
- [x] expressvpn: `yay -S expressvpn`
-
## Bug Fixes
- Fix Keyboard brightness controls:
	- The keyboard brightness hardware key kept appearing to send 2 keystrokes, which was messing up both *xfce4-power-manager* as well as my own keybindings in i3. It appears that the hardware, without any software listening, was responding to the event and lowering the brightness +/- 1 for every keyboard shortcut. Listening using `sudo libinput debug-events` showed that there were to key events for one key press for brightness up and down, as opposed to volume control.
	- Fix: Edit `/etc/default/grub` and modify the following line to read like this. Added the `acpi_backlight=native` and `video.report_key_events=0` parameters:
	```
	GRUB_CMDLINE_LINUX_DEFAULT="acpi_osi=! acpi_osi='Windows 2009' acpi_bac command below in `~/.profile`:
8:export PATH="$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':')$PATH"
 ~/voidrice   archi3 klight=native video.report_key_events=0 quiet resume=UUID=345779e2-480b-4b71-a2d1-111bd0d3ea42"
	```
	- Source: https://forum.manjaro.org/t/solved-kernel-4-14-screen-backlight-randomly-change/35688/3

## ToDo
- [] Create install script to make symbolic link for every file in the LinuxConfig folder (where the link doesn't already exist)
