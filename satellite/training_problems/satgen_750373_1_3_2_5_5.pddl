; params: satgen 750373 1 3 2 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	image1 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation1 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
)
(:goal (and
	(have_image Planet5 image1)
	(have_image Star6 image1)
	(have_image Star7 image0)
	(have_image Star8 image1)
	(have_image Star9 image1)
))

)
