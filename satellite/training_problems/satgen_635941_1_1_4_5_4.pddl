; params: satgen 635941 1 1 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	image3 - mode
	infrared2 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared2)
	(supports instrument0 image3)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Star5 image0)
	(have_image Phenomenon6 image0)
	(have_image Star7 image0)
	(have_image Phenomenon8 infrared2)
))

)
