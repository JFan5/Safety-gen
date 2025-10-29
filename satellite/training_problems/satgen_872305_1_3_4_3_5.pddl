; params: satgen 872305 1 3 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	thermograph2 - mode
	image1 - mode
	image3 - mode
	Star1 - direction
	GroundStation0 - direction
	Star2 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 thermograph2)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Phenomenon3 image1)
	(have_image Planet4 image1)
	(have_image Star5 thermograph0)
	(have_image Star6 image1)
	(have_image Star7 image3)
))

)
