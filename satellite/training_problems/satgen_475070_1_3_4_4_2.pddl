; params: satgen 475070 1 3 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	thermograph0 - mode
	image1 - mode
	thermograph3 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star0 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph3)
	(supports instrument0 image1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Star4 thermograph0)
	(have_image Star5 thermograph3)
))

)
