; params: satgen 767525 1 1 3 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	image1 - mode
	image2 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star6 - direction
	Star1 - direction
	Star3 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(supports instrument0 image2)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Star7 image2)
	(have_image Planet8 thermograph0)
	(have_image Phenomenon9 thermograph0)
))

)
