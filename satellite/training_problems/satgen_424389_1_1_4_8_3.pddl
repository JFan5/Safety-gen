; params: satgen 424389 1 1 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph2 - mode
	image3 - mode
	image0 - mode
	thermograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star5 - direction
	GroundStation6 - direction
	Star7 - direction
	Star4 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star10)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Planet8 image3)
	(have_image Star9 image0)
	(have_image Star10 image0)
))

)
