# IPA2Say

## Overview

A redistribution of the "ipa2say.rb" script developed by "OldPeculier" in a [SuperUser Answer](http://superuser.com/a/887829/175686) that I wanted to share and improve on GitHub.

I take no credit for creating the content of the script, but merely want to make it more convenient to access.
I will however, take credit for making the install script which adds the convenience command to your terminal emulator's login script :).

## Installation Paths

### Default

Installs into `$HOME/.bashrc`:
```bash
 mkdir "$HOME/bin";
 cd "$HOME/bin";
 git clone "https://github.com/Pysis868/IPA2Say";
 cd "IPA2SAY";
 chmod +x "install.sh";
 ./install.sh
```

### Alternative

Installs into the file of your choice using `-c`, for example: `$HOME/.bash_profile`:
```bash
 mkdir "$HOME/bin";
 cd "$HOME/bin";
 git clone "https://github.com/Pysis868/IPA2Say";
 cd "IPA2SAY";
 chmod +x "install.sh";
 ./install.sh -c "$HOME/.bash_profile";
```

## Usage

`sayIPA "ˌɪntərˈnæʃənəl fəˈnɛtɪk ˈælfəˌbɛt fəˈrɛvər"`