#!/usr/bin/env sh

check_package_installed() {
  package="$1"
  if dpkg -s "$package" | grep -q "Status: install ok installed"; then
    echo "$package is already installed"
  else
    echo "$package is not installed"
    sudo dpkg -i "$package"
  fi
}

install_debs() {
  directory=$1
  for file in "$directory"/*.deb; do
    if [ -f "$file" ]; then
      echo "Installing $file ..."
      check_package_installed "$file"
    fi
  done
}

directory="./software_debs"

set -x

if [ "$(ls -A $directory)" ]; then
  echo "Directory is not empty"
  install_debs "$directory"
else
  echo "Directory is empty"
fi

set +x
