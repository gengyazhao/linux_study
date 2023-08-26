#!/bin/bash
#timeout.sh

INTERVAL=5
timeout_read(){
timeout=$1
varname=$2
old_tty_settings=`stty -g`
stty -icanon min 0 time ${timeout}0
eval read $varname
stty "$old_tty_settings"

}
echo;echo -n "What's your name?Quick!"
timeout_read $INTERVAL your_name


echo

if [ ! -z "$your_name" ];then
        echo "your name is $your_name."
else
        echo "Timed out."
fi

echo
#这个脚本的行为可能与timed-input.sh不同，在每次按键的时候，计数器都会重置。

exit 0
