; params: satgen 253774 1 1 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	infrared2 - mode
	image1 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation0 - direction
	Star3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
)
(:goal (and
	(have_image Star3 infrared2)
	(have_image Phenomenon4 image1)
	(have_image Phenomenon5 image1)
	(have_image Planet6 image1)
	(have_image Phenomenon7 thermograph0)
))

)
