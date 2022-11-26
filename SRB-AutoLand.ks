
PRINT "Loading dependencies...".
RUNONCEPATH("0:/common/pid-controllers.ks").

PRINT "SRB OS Loaded".

WAIT 5.


PRINT "Waiting for sepatation...".
WAIT UNTIL SHIP:LIQUIDFUEL = STAGE:LIQUIDFUEL.

LOCAL calculated_throttle IS 0.
LOCAL desired_speed IS 100.
LOCK throttle TO calculated_throttle.

CLEARSCREEN.

PRINT "SEPRATION DETECTED!".
PRINT "Waiting for descent...".
WAIT UNTIL SHIP:VERTICALSPEED < 5.

WAIT 0.5.

SAS ON.
WAIT 0.5.

PRINT "SAS ENABLED".
PRINT "waiting to burn retrograde...".

WAIT 5.
SET SASMODE TO "RADIALOUT".
SAS OFF.
SAS ON.
WAIT 0.
SET SASMODE TO "retrograde".
CLEARSCREEN.

until SHIP:LIQUIDFUEL < 1 {
	if (ALT:RADAR < 200) {
		SET desired_speed TO 10.
	}

	set calculated_throttle to maintain_altitude(0, desired_speed).
}
