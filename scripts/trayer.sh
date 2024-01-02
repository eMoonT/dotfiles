#!/bin/bash

result=$(ps ax| grep -v grep | grep -v trayer.sh | grep trayer)
if [ "$result" == "" ]; then
	# trayer --edge top --tint 10 --align right --widthtype pixel --heighttype pixel --height 40
	trayer --edge top --transparent true --expand false --align right --widthtype pixel --height 40 --SetDockType false --tint 10
else
	killall trayer
fi


# /usr/bin/trayer --edge top --tint 10 --align right --widthtype pixel --heighttype pixel --height 40
