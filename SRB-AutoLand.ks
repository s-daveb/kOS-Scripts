print "Loading dependencies...".
RUNONCEPATH("0:/common/pid-controllers.ks").

print "SRB OS Loaded".

wait 5.

print "Waiting for sepatation...".
wait UNTIL SHIP:LIQUIDFUEL = STAGE:LIQUIDFUEL.

local calculated_throttle IS 0.
local desired_speed IS 100.
lock throttle TO calculated_throttle.

clearscreen.

print "SEPRATION DETECTED!".
print "Waiting for descent...".

wait until SHIP:VERTICALSPEED < 5.

SAS ON.
print "SAS ENABLED".

wait 0.
set SASMODE TO "retrograde".
print "SAS set to " + SASMODE.
wait 2.

clearscreen.

until (SHIP:LIQUIDFUEL < 1) AND (ALT:RADAR > 10) {
	set desired_speed to (ALT:RADAR / 10).

	if (ALT:RADAR < 100) AND (SHIP:VERTICALSPEED < 0) {
		set SASMODE TO "RADIALOUT".
		LEGS ON.
	}

	if (ALT:RADAR < 10) { break. }

	set calculated_throttle to maintain_altitude(0, desired_speed).
}

set calculated_throttle to 0.
