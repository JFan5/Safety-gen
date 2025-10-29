; params: satgen 756988 1 2 3 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	image2 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star3 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(have_image Star5 infrared0)
	(have_image Phenomenon6 image2)
))

)
