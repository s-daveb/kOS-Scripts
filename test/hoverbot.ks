
print "Loading dependencies...".
wait 1.

runoncepath("0:/pid-controllers.ks").
runoncepath("0:/prettyprint.ks").

print "Loaded".

wait 1.
clearscreen.

SAS ON.
SET SASMODE to "RADIALOUT".

print "SAS ON".
local calculated_throttle is 0.
lock throttle to calculated_throttle.

set desired_speed to 10.  // in m/s
set desired_alt to 0.   // in m

stage.
until ship:liquidfuel < 1 {
	set calculated_throttle to maintain_altitude(desired_alt, desired_speed).
}
stage.

