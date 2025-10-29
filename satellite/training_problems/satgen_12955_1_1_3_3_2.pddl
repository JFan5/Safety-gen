; params: satgen 12955 1 1 3 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	image0 - mode
	image2 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Star4 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image2)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Phenomenon3 image0)
	(have_image Star4 image2)
))

)
