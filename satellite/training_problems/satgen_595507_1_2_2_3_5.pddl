; params: satgen 595507 1 2 2 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	infrared0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Star3 infrared0)
	(have_image Planet4 infrared0)
	(have_image Phenomenon5 infrared0)
	(have_image Star6 thermograph1)
	(have_image Star7 infrared0)
))

)
