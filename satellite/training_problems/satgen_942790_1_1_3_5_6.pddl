; params: satgen 942790 1 1 3 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	infrared1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
)
(:goal (and
	(pointing satellite0 Planet10)
	(have_image Star5 image2)
	(have_image Planet6 image2)
	(have_image Star7 thermograph0)
	(have_image Planet8 thermograph0)
	(have_image Star9 thermograph0)
	(have_image Planet10 image2)
))

)
