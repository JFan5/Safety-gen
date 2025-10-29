; params: satgen 851276 1 1 2 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
)
(:goal (and
	(have_image Star3 infrared0)
	(have_image Star4 image1)
	(have_image Phenomenon5 image1)
))

)
