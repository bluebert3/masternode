#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/digiwaged.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='digiwage/digiwage'
# Display Name.
DAEMON_NAME='Digiwage Core'
# Coin Ticker.
TICKER='WAGE'
# Binary base name.
BIN_BASE='digiwage'
# Directory.
DIRECTORY='.digiwage'
# Conf File.
CONF='digiwage.conf'
# Port.
DEFAULT_PORT=46003
# Explorer URL.
EXPLORER_URL='http://144.202.110.14/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=12000
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1

# Dropbox Addnodes
DROPBOX_ADDNODES='03zwn40iqicd7jn'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP='bgz02ucvl9d04bo'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='buz5scz9z7yhbtd'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "DIGIWAGE"
 ____  _       _                             ____
|  _ \(_) __ _(_)_      ____ _  __ _  ___   / ___|___  _ __ ___
| | | | |/ _` | \ \ /\ / / _` |/ _` |/ _ \ | |   / _ \| '__/ _ \
| |_| | | (_| | |\ V  V / (_| | (_| |  __/ | |__| (_) | | |  __/
|____/|_|\__, |_| \_/\_/ \__,_|\__, |\___|  \____\___/|_|  \___|
         |___/                 |___/

DIGIWAGE
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- goo.gl/uQw9tz -O ~/___mn.sh
  COUNTER=1
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null
