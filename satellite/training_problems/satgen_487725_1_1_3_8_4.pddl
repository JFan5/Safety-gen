; params: satgen 487725 1 1 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	thermograph1 - mode
	infrared0 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	GroundStation1 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(have_image Planet8 infrared0)
	(have_image Star9 infrared0)
	(have_image Star10 thermograph1)
	(have_image Star11 thermograph1)
))

)
