; params: satgen 341344 1 2 3 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	infrared0 - mode
	thermograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Phenomenon3 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Phenomenon3 thermograph1)
	(have_image Star4 infrared0)
	(have_image Planet5 infrared2)
	(have_image Phenomenon6 thermograph1)
))

)
