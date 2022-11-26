
runoncepath("0:/common/prettyprint.ks").

function maintain_altitude {
parameter desired_alt.   // in m
parameter desired_speed. // in m/s

local throttle_controller is pidloop(0.33, 0.33, 0.33, 0, 1 ).
local speed_controller    is pidloop(0.63, 0.33, 0.03, (-1*desired_speed), desired_speed).

set speed_controller:setpoint to desired_alt.

	set desired_speed to speed_controller:update(time:Seconds, ALT:RADAR).
	set throttle_controller:setpoint to desired_speed.

	local calculated_throttle to
		throttle_controller:update(time:Seconds, SHIP:VERTICALSPEED).

	print_vessel_stats(calculated_throttle).
	print_target_stats(desired_alt, desired_speed).

	print SASMODE at (0,24).

	return calculated_throttle.
}

