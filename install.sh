#!/bin/bash
SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

[[ -z "$__DEBUG__" ]] && __DEBUG__="false";

usage() {
  echo -e "Usage: $(basename "$0") [-c <userConfigurationFilePath>] [-h]";
  echo -e "\t-h - Displays help text for using this script, and then exits."
  echo -e "\t-c userConfigurationFilePath - A string containing the expected output file path for the current user's terminal configuration file. If no file path is specified, a default of \"$HOME/.bashrc\" is used.  The file's existing contents will be preserved, with the contents added by this script only if they do not already exist.";
  
  exit 1;
}

while getopts ":c:h" option; do
  case "$option" in
    h)
      usage;
    ;;
    c)
      userConfigurationFilePath="$OPTARG";
    ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2;
      usage;
      exit 1
    ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2;
      exit 1;
    ;;
  esac
done

shift $((OPTIND-1));

[[ -z "$userConfigurationFilePath" ]] && userConfigurationFilePath="$HOME/.bashrc";
commandString="alias sayIPA='echo \"\$1\" | ruby $SDIR/ipa2say.rb | say';";

[[ "$__DEBUG__" == "true" ]] && echo "SDIR: $SDIR";
[[ "$__DEBUG__" == "true" ]] && echo "commandString: $commandString";
[[ "$__DEBUG__" == "true" ]] && echo "userConfigurationFilePath: $userConfigurationFilePath";

if [[ ! -f "$userConfigurationFilePath" ]]; then
  touch "$userConfigurationFilePath";
fi

if grep -Fq "$commandString" "$userConfigurationFilePath"; then
  echo "Instruction found; exiting without changes...";
else
  echo "Instruction not found; inserting instruction...";
  echo -e "\n\n$commandString" >> "$userConfigurationFilePath";
fi