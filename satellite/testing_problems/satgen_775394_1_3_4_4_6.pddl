; params: satgen 775394 1 3 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image2 - mode
	thermograph0 - mode
	image3 - mode
	image1 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation1 - direction
	Planet4 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image1)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
)
(:goal (and
	(have_image Planet4 image3)
	(have_image Planet5 image3)
	(have_image Star6 image1)
	(have_image Star7 thermograph0)
	(have_image Phenomenon8 thermograph0)
	(have_image Phenomenon9 thermograph0)
))

)
