clear

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

cd /tmp

echo -e "\e[34mWelcome back commander"
echo -e "\e[92mStarting script now"
echo -e "\e[91mMade with ♥ for \e[1mElementaryOS 5.0"

echo "★彡 Enable add-apt-repository 彡★"
sudo apt update
sudo apt install -y software-properties-common
echo

echo "★彡 Add repo's 彡★"
echo "Switch to daily elementary repo"
sudo sed -i 's/stable/daily/g' /etc/apt/sources.list.d/elementary.list
echo "Add repository for Timeshift"
sudo add-apt-repository -y --no-update ppa:teejee2008/ppa
echo "Add repository for Elementary-tweaks"
sudo add-apt-repository -y --no-update ppa:philip.scott/elementary-tweaks
echo "Add repository for Gamehub"
sudo add-apt-repository -y --no-update ppa:tkashkin/gamehub
echo "Add repository for tlp"
sudo add-apt-repository -y --no-update ppa:linrunner/tlp
echo "Add repository for Java"
sudo add-apt-repository -y --no-update ppa:webupd8team/java
echo "Enable partner repository"
sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
echo

echo "★彡 Update repo's 彡★"
sudo apt update
echo

echo "★彡 Install packages 彡★"

echo "Install git"
sudo apt install -y git
#echo "Install Nvidia Drivers"
#sudo apt install -y nvidia-driver-390
echo "Install Timeshift"
sudo apt install -y timeshift
echo "Install Node & Npm"
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt install -y nodejs
echo "Install Bleachbit"
sudo apt install -y bleachbit
echo "Install Chrome (beta)"
wget https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb -O google-chrome.deb
sudo apt install -y ./google-chrome.deb
echo "Install Gparted"
sudo apt install -y gparted
echo "Install Gnome system monitor"
sudo apt install -y gnome-system-monitor
echo "Install Simple Screen Recorder"
sudo apt install -y simplescreenrecorder
echo "Install Hack Font"
sudo apt install -y fonts-hack-ttf
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 10"
echo "Install Git"
sudo apt install -y git
echo "Install Adb and Fastboot"
sudo apt install -y adb fastboot
echo "Install Snap"
sudo apt install -y snapd
echo "Install Python Libraries"
sudo apt install -y python3-dev
echo "Install Pipenv"
sudo apt install -y python3-pip
sudo pip3 install pipenv
echo "Install python3-setuptools"
sudo apt install -y python3-setuptools
echo "Install ppa-purge"
sudo apt install -y ppa-purge
echo "Install unrar"
sudo apt install -y unrar
echo "Install Zsh"
sudo apt install -y zsh
sudo -S chsh -s '/bin/zsh' "${USER}"
echo "Install Eddy"
sudo apt install -y com.github.donadigo.eddy
echo "Install Sublime Text"
sudo snap install sublime-text --classic
echo "Install Insomnia"
sudo snap install insomnia
echo "Install elementary-x Theme"
sudo git clone https://github.com/surajmandalcell/elementary-x.git /usr/share/themes/elementary-x
echo "Install Solaar"
sudo apt install -y solaar
echo "Install TheFuck"
sudo pip3 install thefuck
echo "Install ninja-build"
sudo apt install ninja-build
echo "Install elementary-tweaks"
sudo apt install elementary-tweaks
echo "Install gamehub"
sudo apt install com.github.tkashkin.gamehub
echo "Install tlp"
sudo apt-get install tlp tlp-rdw
echo "Install npm"
sudo apt-get install npm
echo "Install s-tui"
sudo pip3 install s-tui
echo "Install undervolt"
sudo pip3 install undervolt
echo "Install dry"
curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
sudo chmod 755 /usr/local/bin/dry
echo

echo "★彡 Upgrade packages 彡★"
sudo apt upgrade -y
sudo apt dist-upgrade -y
echo

mkdir ~/.templates

gsettings set apps.light-locker lock-on-suspend false
gsettings set apps.light-locker lock-after-screensaver 0

gsettings set io.elementary.desktop.wingpanel.datetime clock-format '24h'

gsettings set io.elementary.terminal.settings unsafe-paste-alert false

gsettings set org.pantheon.desktop.gala.behavior overlay-action ''
gsettings set io.elementary.dpms standby-time 0

gsettings set org.gnome.gnome-system-monitor show-whose-processes 'all'
gsettings set org.gnome.gnome-system-monitor.proctree col-22-visible false # Total disk read
gsettings set org.gnome.gnome-system-monitor.proctree col-23-visible false # Total disk write
gsettings set org.gnome.gnome-system-monitor.proctree col-24-visible false # Disk read
gsettings set org.gnome.gnome-system-monitor.proctree col-25-visible false # Disk write
gsettings set org.gnome.gnome-system-monitor.proctree col-26-visible false # Priority
gsettings set org.gnome.gnome-system-monitor.proctree col-21-visible true # Owner
gsettings set org.gnome.gnome-system-monitor.proctree col-14-visible true # Command line
gsettings set org.gnome.gnome-system-monitor.proctree columns-order '[0,12,1,8,15,21,14]'
gsettings set org.gnome.gnome-system-monitor.proctree sort-col 15 # Memory

gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 5000
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0

gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing false
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'default'
gsettings set org.gnome.desktop.peripherals.mouse speed -0.6

gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true

ln -s /media/Dropbox ~/Dropbox
ln -s /media/Downloads ~/Downloads
ln -s /media/Videos ~/Videos
ln -s /media/Dropbox/Stuff ~/Stuff
ln -s /media/.Trash-1000 ~/.Trash

sudo sed -i '/swapfile/d' /etc/fstab
sudo swapoff /swapfile
sudo rm /swapfile

sudo sh -c 'echo "DefaultTimeoutStartSec=10s" >> /etc/systemd/system.conf'
sudo sh -c 'echo "DefaultTimeoutStopSec=10s" >> /etc/systemd/system.conf'

sleep 5

clear

echo -e "\e[91m!WARNING Auto reboot in 60 seconds!"
echo -e "\e[91m!WARNING Auto reboot in 60 seconds!"
echo -e "\e[91m!WARNING Auto reboot in 60 seconds!"

sleep 60

