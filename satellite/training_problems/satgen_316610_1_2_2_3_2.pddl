; params: satgen 316610 1 2 2 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation0 - direction
	Phenomenon3 - direction
	Planet4 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(pointing satellite0 Phenomenon3)
	(have_image Phenomenon3 spectrograph0)
	(have_image Planet4 thermograph1)
))

)
