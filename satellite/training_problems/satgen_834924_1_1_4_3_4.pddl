; params: satgen 834924 1 1 4 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	image3 - mode
	image0 - mode
	image1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star0 - direction
	Star3 - direction
	Planet4 - direction
	Planet5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(supports instrument0 image3)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Star3 image3)
	(have_image Planet4 image0)
	(have_image Planet5 infrared2)
	(have_image Phenomenon6 infrared2)
))

)
