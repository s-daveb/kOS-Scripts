
print "Loading dependencies...".

runoncepath("0:/common/pid-controllers.ks").
runoncepath("0:/common/print-status.ks").

print "Loaded".

wait 1.
clearscreen.

SAS ON.
wait 0.
SET SASMODE to "RADIALOUT".

print "SAS ON".
local calculated_throttle is 0.
lock throttle to calculated_throttle.

set desired_speed to 5.  // in m/s
set desired_alt to 12.   // in m

stage.
until ship:liquidfuel < 10 {
	set calculated_throttle to maintain_altitude(desired_alt, desired_speed).
}

until shi:liquidfuel < 1 {
	set calculated_throttle to maintain_altitude(2, 2.0).
}
stage.

