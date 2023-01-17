
function print_vessel_stats {
	parameter current_throttle.

	print "current alt: " + ALT:RADAR at (0,12).
	print "current speed: " + SHIP:VERTICALSPEED at (0,14).
	print "throttle: " + (current_throttle * 100) + "%          "  at (0,17).

	IF SAS print ("SAS: " + SASMODE) at (0,24).
}

function print_target_stats {
	parameter desired_alt.
	parameter desired_speed.

	print "target alt: " + desired_alt at (1,13).
	print "target speed: " + desired_speed at (1,15).
}

