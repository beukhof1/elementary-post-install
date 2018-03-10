clear

cd /tmp

echo "*** Enable add-apt-repository ***"
sudo apt update
sudo apt-get install -y software-properties-common
echo

echo "*** Add repositories ***"
echo "Switch to daily elementary repository"
sudo sed -i 's/stable/daily/g' /etc/apt/sources.list.d/elementary.list
echo "Add repository for Nvidia driver"
sudo add-apt-repository -y --no-update ppa:graphics-drivers/ppa
echo "Add repository for Quodlibet"
sudo add-apt-repository -y --no-update ppa:lazka/ppa
echo "Add repository for Timeshift"
sudo add-apt-repository -y --no-update ppa:teejee2008/ppa
echo "Add repository for Java"
sudo add-apt-repository -y --no-update ppa:webupd8team/java
echo "Add repository for Simple Screen Recorder"
sudo add-apt-repository -y --no-update ppa:maarten-baert/simplescreenrecorder
echo "Add repository for Bomi"
sudo add-apt-repository -y --no-update ppa:nemonein/tailored
echo "Add repository for Sublime Text 3"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo sh -c 'echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list'
#echo "Add repository for Insomnia"
#wget -qO - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
#sudo sh -c 'echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" > /etc/apt/sources.list.d/insomnia.list'
echo "Enable partner repository"
sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
echo

echo "*** Update repositories ***"
sudo apt update
echo

echo "*** Install packages ***"
echo "Install Nvidia driver"
sudo apt-get install -y nvidia-390 nvidia-prime
echo "Install Quodlibet"
sudo apt-get install -y quodlibet
echo "Install Timeshift"
sudo apt-get install -y timeshift
echo "Install Java 8"
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true'
sudo debconf-set-selections <<< 'oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true'
sudo apt-get install -y oracle-java8-installer
echo "Install Sublime Text 3"
sudo apt-get install -y sublime-text
#echo "Install Insomnia"
#sudo apt-get install -y insomnia
echo "Install Bleachbit"
sudo apt-get install -y bleachbit
echo "Install rEFInd"
sudo apt-get install -y refind
echo "Install Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
sudo apt install -y ./google-chrome.deb
echo "Install Puddletag"
sudo apt-get install -y puddletag
echo "Install Deluge"
sudo apt-get install -y deluge
echo "Install Gparted"
sudo apt-get install -y gparted
echo "Install Gnome system monitor"
sudo apt-get install -y gnome-system-monitor
echo "Install Simple Screen Recorder"
sudo apt-get install -y simplescreenrecorder
echo "Install Bomi"
sudo apt-get install -y bomi
echo "Install Hack Font"
sudo apt-get install -y fonts-hack-ttf
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 10"
echo "Install Git"
sudo apt-get install -y git
echo "Install Yadm"
sudo apt-get install -y yadm
echo "Install Adb and Fastboot"
sudo apt-get install -y adb fastboot
echo "Install Snap"
sudo apt-get install -y snapd
echo "Install Python Libraries"
sudo apt-get install -y python3-dev
echo "Install Pipenv"
sudo apt-get install -y python3-pip
sudo pip3 install pipenv
echo "Install Pyenv"
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
echo "Install ppa-purge"
sudo apt-get install -y ppa-purge
echo "Install unrar"
sudo apt-get install -y unrar
echo "Install Gksu"
sudo apt-get install -y gksu
echo "Install Zsh"
sudo apt-get install -y zsh
sudo -S chsh -s '/bin/zsh' "${USER}"
echo "Install Eddy"
sudo apt-get install -y com.github.donadigo.eddy --no-install-recommends
echo "Install custom icon theme"
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AABXhrHOztoAG10khWUSQ-ASa/elementary-djaler.deb?raw=1 -O elementary-djaler.deb
sudo apt install -y ./elementary-djaler.deb
gsettings set org.gnome.desktop.interface icon-theme elementary-djaler
echo "Install Electrum"
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AAAH39Okv49rQuiGdi_MuK5Ia/python-electrum.deb?raw=1 -O python-electrum.deb
sudo apt install -y ./python-electrum.deb
wget https://www.dropbox.com/sh/k7572lqytnw2iry/AAAUxsVVTi662ua4gDtCcwHZa/electrum.deb?raw=1 -O electrum.deb
sudo apt install -y ./electrum.deb
echo "Install Dropbox"
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O dropbox.deb
sudo apt install -y ./dropbox.deb
echo "Install Intellij Idea"
sudo snap install intellij-idea-ultimate --classic
echo "Install PyCharm"
sudo snap install pycharm-professional --classic
echo "Install Slack"
sudo snap install slack --classic
echo

echo "*** Uninstall packages ***"
sudo apt-get purge -y wingpanel-indicator-bluetooth
sudo apt-get purge -y switchboard-plug-gcc-wacom switchboard-plug-printers switchboard-plug-sharing switchboard-plug-online-accounts switchboard-plug-parental-controls switchboard-plug-gcc-color switchboard-plug-bluetooth switchboard-plug-display
sudo apt-get purge -y capnet-assist libcodecore0 appcenter pantheon-calculator libmaya-calendar0 epiphany-browser-data libnoise-core0 simple-scan audience snap-photobooth evolution-data-server
sudo apt-get purge -y language-pack-bg language-pack-bg-base language-pack-gnome-bg language-pack-gnome-bg-base language-pack-ca language-pack-ca-base language-pack-gnome-ca language-pack-gnome-ca-base language-pack-cs language-pack-cs-base language-pack-gnome-cs language-pack-gnome-cs-base language-pack-da language-pack-da-base language-pack-gnome-da language-pack-gnome-da-base language-pack-de language-pack-de-base language-pack-gnome-de language-pack-gnome-de-base language-pack-es language-pack-es-base language-pack-gnome-es language-pack-gnome-es-base language-pack-fr language-pack-fr-base language-pack-gnome-fr language-pack-gnome-fr-base language-pack-hu language-pack-hu-base language-pack-gnome-hu language-pack-gnome-hu-base language-pack-id language-pack-id-base language-pack-gnome-id language-pack-gnome-id-base language-pack-gnome-it language-pack-gnome-it-base language-pack-it language-pack-it-base language-pack-ja language-pack-ja-base language-pack-gnome-ja language-pack-gnome-ja-base language-pack-ko language-pack-ko-base language-pack-gnome-ko language-pack-gnome-ko-base language-pack-nb language-pack-nb-base language-pack-gnome-nb language-pack-gnome-nb-base language-pack-nl language-pack-nl-base language-pack-gnome-nl language-pack-gnome-nl-base language-pack-pl language-pack-pl-base language-pack-gnome-pl language-pack-gnome-pl-base language-pack-gnome-pt language-pack-gnome-pt-base language-pack-pt language-pack-pt-base language-pack-sv language-pack-sv-base language-pack-gnome-sv language-pack-gnome-sv-base language-pack-th language-pack-th-base language-pack-gnome-th language-pack-gnome-th-base language-pack-tr language-pack-tr-base language-pack-gnome-tr language-pack-gnome-tr-base language-pack-uk language-pack-uk-base language-pack-gnome-uk language-pack-gnome-uk-base language-pack-vi language-pack-vi-base language-pack-gnome-vi language-pack-gnome-vi-base language-pack-zh language-pack-zh-base language-pack-gnome-zh language-pack-gnome-zh-base language-pack-gnome-zh-hans language-pack-gnome-zh-hans-base language-pack-zh-hans language-pack-zh-hans-base language-pack-zh-hant language-pack-zh-hant-base language-pack-gnome-zh-hant language-pack-gnome-zh-hant-base
sudo apt-get purge -y wbulgarian wbrazilian wfrench witalian wngerman wspanish wportuguese wdanish wdutch wpolish wukrainian wnorwegian wcatalan wswedish
sudo apt-get purge -y mpv
sudo apt-get purge -y fonts-noto-cjk
sudo apt-get purge -y brltty
sudo apt-get purge -y grub-efi-amd64 grub-efi-amd64-signed grub-efi-amd64-bin grub-common grub2-common shim-signed mokutil os-prober secureboot-db shim
sudo apt-get autoremove -y
echo

echo "*** Upgrade packages ***"
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
echo

git clone https://github.com/png2378/telegram-icon-updater.git
cd telegram-icon-updater
bash setup.sh --install
cd /tmp

mkdir ~/.templates
rm -rf ~/Documents
rm -rf ~/Pictures
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Downloads
rm -rf ~/Music
rm -rf ~/Videos
rm -rf ~/Desktop
rm -rf ~/.config/epiphany
rm -rf ~/.local/share/io.elementary.code/
rm -rf ~/.local/share/epiphany

sudo rm /usr/share/contractor/print.contract
sudo rm /usr/share/contractor/gnome-bluetooth.contract
sudo sh -c 'echo "[Contractor Entry]" > /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Name=Открыть от имени суперпользователя" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Icon=pantheon-files" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "MimeType=inode;" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "Exec=sh -c \"pkexec io.elementary.files %U\"" >> /usr/share/contractor/folder-openasroot.contract'
sudo sh -c 'echo "X-GNOME-Gettext-Domain=pantheon-files" >> /usr/share/contractor/folder-openasroot.contract'

wget https://github.com/zheludkovm/LinuxJavaFixes/blob/master/build/LinuxJavaFixes-1.0.0-SNAPSHOT.jar?raw=true -O LinuxJavaFixes-1.0.0-SNAPSHOT.jar
wget https://github.com/zheludkovm/LinuxJavaFixes/blob/master/build/javassist-3.12.1.GA.jar?raw=true -O javassist-3.12.1.GA.jar
mkdir /opt/HotkeysFix
cp LinuxJavaFixes-1.0.0-SNAPSHOT.jar /opt/HotkeysFix/
cp javassist-3.12.1.GA.jar /opt/HotkeysFix/

yadm clone https://github.com/Djaler/dotfiles.git
yadm reset --hard origin/master
yadm remote set-url origin git@github.com:Djaler/dotfiles.git

gsettings set apps.light-locker lock-on-suspend false
gsettings set apps.light-locker lock-after-screensaver 0

gsettings set io.elementary.terminal.settings unsafe-paste-alert false
gsettings set io.elementary.files.preferences single-click false
gsettings set io.elementary.screenshot-tool folder-dir '/home/djaler'

gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.peripherals.mouse speed -0.6
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle','terminate:ctrl_alt_bksp']"

sudo sh -c 'echo "/dev/sdb1			/media					ext4	defaults		0	0" >> /etc/fstab'
sudo sh -c 'echo "tmpfs				/tmp					tmpfs	rw,nosuid,nodev		0	0" >> /etc/fstab'

ln -s /media/Dropbox ~/Dropbox
ln -s /media/Downloads ~/Downloads
ln -s /media/Videos ~/Videos
ln -s /media/Dropbox/Music ~/Music
ln -s /media/Dropbox/Stuff ~/Stuff
ln -s /media/.Trash-1000 ~/.Trash

sudo chown djaler:djaler -R /media
sudo chown djaler:djaler -R /opt

sudo sh -c 'echo "LANG=ru_RU.UTF-8" > /etc/default/locale'

sed -i '/swapfile/d' ./etc/fstab
sudo swapoff /swapfile
sudo rm /swapfile

sudo rm -rf /boot/grub
sudo rm -rf /boot/efi/EFI/ubuntu
wget http://www.rodsbooks.com/refind/grub-pc_3.0-1_all.deb -O grub-pc_3.0-1_all.deb
sudo apt install -y ./grub-pc_3.0-1_all.deb

sudo sh -c 'echo "DefaultTimeoutStartSec=10s" >> /etc/systemd/system.conf'
sudo sh -c 'echo "DefaultTimeoutStopSec=10s" >> /etc/systemd/system.conf'

sudo sh -c 'echo "10.128.0.108	git.phoenix-dnr.ru" >> /etc/hosts'
sudo sh -c 'echo "10.128.0.150	jira.phoenix-dnr.ru" >> /etc/hosts'

sudo reboot
