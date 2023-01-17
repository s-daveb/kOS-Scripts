print "Loading dependencies...".
RUNONCEPATH("0:/common/print-status.ks").



until 1 < 0 {
	print_vessel_stats(throttle).
	print_target_stats(-999, -999).

	wait 0.

	clearscreen.
}
