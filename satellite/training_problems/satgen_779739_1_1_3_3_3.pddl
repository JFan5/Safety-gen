; params: satgen 779739 1 1 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image2 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation2 - direction
	Star0 - direction
	Star3 - direction
	Phenomenon4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Star3 image2)
	(have_image Phenomenon4 image2)
	(have_image Star5 infrared1)
))

)
