#!/bin/bash
SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

[[ -z "$__DEBUG__" ]] && __DEBUG__="false";

debugPrint() {
  [[ "$__DEBUG__" == "true" ]] && echo -e "$*";
}

defaultConfigurationFilePathString="\$HOME/.bashrc";
defaultConfigurationFilePath="$(eval "echo \"$defaultConfigurationFilePathString\"")";
defaultFishConfigurationFilePathString="\$HOME/.config/fish/config.fish";
defaultFishConfigurationFilePath="$(eval "echo \"$defaultFishConfigurationFilePathString\"")";

usage() {
  echo -e "Usage: $(basename "$0") [-h] [-c <userConfigurationFilePath>] [-f] [-o]";
  echo -e "\t-h - Displays help text for using this script, and then exits.";
  echo -e "\t-c userConfigurationFilePath - Accepts a string containing the expected output file path for the current user's terminal configuration file.";
  echo -e "\t-f - Instead of generating Bash-supported instructions, generates instructions that install the convenience command for the Friendly Interactive SHell.  Changes the default terminal configuration file path to \"$defaultFishConfigurationFilePath\"";
  echo -e "\t-o - Instead of directly storing the instructions inside of a terminal configuration file, outputs them to the terminal.";
  echo -e "";
  echo -e "By default, this script installs to the \"$defaultConfigurationFilePathString\" terminal login configuration file.";
  echo -e "The file's existing contents will be preserved, with the contents added by this script only if they do not already exist.";
  
  exit 1;
}

while getopts ":c:hfo" option; do
  case "$option" in
    h)
      usage;
    ;;
    c)
      userConfigurationFilePath="$OPTARG";
    ;;
    f)
      generateFishConfiguration="true";
      userConfigurationFilePath="$defaultFishConfigurationFilePath";
    ;;
    o)
      outputToTerminal="true";
    ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2;
      usage;
      exit 1;
    ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2;
      exit 1;
    ;;
  esac
done

shift $((OPTIND-1));

[[ -z "$userConfigurationFilePath" ]] && userConfigurationFilePath="$defaultConfigurationFilePath";

if [[ "$generateFishConfiguration" == "true" ]]; then
  read -r -d '' commandString << EOI
function sayIPA
  echo "\$1" | ruby "$SDIR/ipa2say.rb" | say;
end
EOI
  commandStringIdentifier="${commandString:0:15}";
else
  commandString="alias sayIPA='echo \"\$1\" | ruby \"$SDIR/ipa2say.rb\" | say';";
  commandStringIdentifier="${commandString:0:13}";
fi

debugPrint "SDIR: $SDIR";
debugPrint "defaultConfigurationFilePathString: $defaultConfigurationFilePathString";
debugPrint "defaultConfigurationFilePath: $defaultConfigurationFilePath";
debugPrint "defaultFishConfigurationFilePathString: $defaultFishConfigurationFilePathString";
debugPrint "defaultFishConfigurationFilePath: $defaultFishConfigurationFilePath";
debugPrint "userConfigurationFilePath: $userConfigurationFilePath";
debugPrint "generateFishConfiguration: $generateFishConfiguration";
debugPrint "commandString: $commandString";
debugPrint "commandStringIdentifier: $commandStringIdentifier";

if [[ "$outputToTerminal" == "true" ]]; then
  echo "$commandString";
else
  if [[ ! -f "$userConfigurationFilePath" ]]; then
    touch "$userConfigurationFilePath";
  fi
  
  if grep -Fq "$commandStringIdentifier" "$userConfigurationFilePath"; then
    echo "Instruction found; exiting without changes...";
  else
    echo "Instruction not found; inserting instruction...";
    echo -e "\n\n$commandString" >> "$userConfigurationFilePath";
  fi
fi