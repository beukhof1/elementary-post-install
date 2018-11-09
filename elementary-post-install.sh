clear

cd /tmp

echo "*** Enable add-apt-repository ***"
sudo apt update
sudo apt-get install -y software-properties-common
echo

echo "*** Add repositories ***"
echo "Switch to daily elementary repository"
sudo sed -i 's/stable/daily/g' /etc/apt/sources.list.d/elementary.list
echo "Add repository for Timeshift"
sudo add-apt-repository -y --no-update ppa:teejee2008/ppa
echo "Add repository for Java"
sudo add-apt-repository -y --no-update ppa:webupd8team/java
echo "Enable partner repository"
sudo sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
echo

echo "*** Update repositories ***"
sudo apt update
echo

echo "*** Install packages ***"
echo "Install Nvidia Drivers"
sudo apt-get install -y nvidia-driver-390
echo "Install Timeshift"
sudo apt-get install -y timeshift
echo "Install Node & Npm"
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get install -y nodejs
echo "Install Bleachbit"
sudo apt-get install -y bleachbit
echo "Install Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
sudo apt install -y ./google-chrome.deb
echo "Install Deluge"
sudo apt-get install -y deluge
echo "Install Gparted"
sudo apt-get install -y gparted
echo "Install Gnome system monitor"
sudo apt-get install -y gnome-system-monitor
echo "Install Simple Screen Recorder"
sudo apt-get install -y simplescreenrecorder
echo "Install Hack Font"
sudo apt-get install -y fonts-hack-ttf
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 10"
echo "Install Git"
sudo apt-get install -y git
echo "Install Adb and Fastboot"
sudo apt-get install -y adb fastboot
echo "Install Snap"
sudo apt-get install -y snapd
echo "Install Python Libraries"
sudo apt-get install -y python3-dev
echo "Install Pipenv"
sudo apt-get install -y python3-pip
sudo pip3 install pipenv
echo "Install ppa-purge"
sudo apt-get install -y ppa-purge
echo "Install unrar"
sudo apt-get install -y unrar
echo "Install Zsh"
sudo apt-get install -y zsh
sudo -S chsh -s '/bin/zsh' "${USER}"
echo "Install Eddy"
sudo apt-get install -y com.github.donadigo.eddy
echo "Install Slack"
sudo snap install slack --classic
echo "Install Sublime Text"
sudo snap install sublime-text --classic
echo "Install Insomnia"
sudo snap install insomnia
echo

echo "*** Upgrade packages ***"
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
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

sudo rm -rf /boot/efi/EFI/ubuntu

sudo sh -c 'echo "DefaultTimeoutStartSec=10s" >> /etc/systemd/system.conf'
sudo sh -c 'echo "DefaultTimeoutStopSec=10s" >> /etc/systemd/system.conf'

sudo reboot
