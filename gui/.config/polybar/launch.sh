#!/bin/sh
(
	flock 200

	# kill polybar, and wait until it's dead
	pkill -u $UID polybar
	while pgrep -u $UID polybar > /dev/null; do sleep 0.5; done

	outputs_raw=$(polybar -m)
	outputs=$(echo "$outputs_raw" | cut -d: -f1)
	main=$(echo "$outputs_raw" | grep primary | cut -d: -f1) # main output is primary monitor

	for m in $outputs; do
		export MONITOR=$m

		bar=secondary
		if [ "$m" == "$main" ]; then
			bar=main
		fi

		polybar --reload $bar </dev/null >/var/tmp/polybar-$bar-$m.log 2>&1 200>&- &
		disown
	done
) 200>/var/tmp/polybar-launch.lock
