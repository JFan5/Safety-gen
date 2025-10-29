; params: satgen 132369 1 2 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	infrared2 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	Star7 - direction
	Star1 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(have_image Phenomenon8 infrared2)
	(have_image Phenomenon9 image1)
	(have_image Planet10 image0)
	(have_image Phenomenon11 image0)
))

)
