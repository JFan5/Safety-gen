; params: satgen 567869 1 1 2 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	Planet4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Planet4)
	(have_image Planet4 infrared0)
	(have_image Planet5 infrared0)
))

)
