; params: satgen 174118 2 3 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph2 - mode
	image1 - mode
	image0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation2 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(have_image Planet4 image1)
	(have_image Phenomenon5 image1)
	(have_image Star6 image0)
	(have_image Star7 image1)
	(have_image Phenomenon8 thermograph2)
	(have_image Star9 image0)
))

)
