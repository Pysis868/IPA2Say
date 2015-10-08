# IPA2Say

## Overview

A redistribution and improvement of the "ipa2say.rb" script developed by "[OldPeculier"](https://superuser.com/users/152258/oldpeculier) in a [SuperUser Answer](http://superuser.com/a/887829/175686) that I wanted to share and improve on GitHub.

Involves having the Mac's `say` command take input in the form of the [International Phonetic Alphabet](https://en.wikipedia.org/wiki/International_Phonetic_Alphabet), to produce sound output, instead of normal text.

I take no credit for creating the main content of the script, but merely want to make it more convenient to access, and also offer improvements along the way.
I will however, also take credit for making the install script which adds the convenience command to your terminal emulator's configuration script :).

## Installation

 - First, download the project:

 ```bash
  mkdir "$HOME/bin";
  cd "$HOME/bin";
  git clone "https://github.com/Pysis868/IPA2Say";
  cd "IPA2Say";
  chmod +x "install.sh";
 ```
 - Then run one of the following commands based on your preference/environment:
  - Default Bash Installation; installs into `$HOME/.bashrc` by default:
   ```bash
     ./install.sh
   ```
  - Alternative Bash Installation; installs into the file of your choice using the `-c` switch, for example: `$HOME/.bash_profile`:
   ```bash
     ./install.sh -c "$HOME/.bash_profile";
   ```
  - Fish Installation; installs into `$HOME/.config/fish/config.fish` by default, using the `-f` switch:
   ```bash
     ./install.sh -f
   ```
     Note: You may also use the `-c` switch in this case.
  - Custom Installation; outputs text to the terminal that can be piped into anything of your choice using the `-o` switch:
   ```bash
    ./install.sh -o
   ```

## Usage

Example: `sayIPA "ˌɪntərˈnæʃənəl fəˈnɛtɪk ˈælfəˌbɛt fəˈrɛvər"`