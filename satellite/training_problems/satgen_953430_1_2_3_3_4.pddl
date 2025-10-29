; params: satgen 953430 1 2 3 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	image1 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet3)
)
(:goal (and
	(have_image Planet3 thermograph0)
	(have_image Phenomenon4 image1)
	(have_image Phenomenon5 infrared2)
	(have_image Star6 image1)
))

)
