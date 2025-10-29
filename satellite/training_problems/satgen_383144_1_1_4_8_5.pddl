; params: satgen 383144 1 1 4 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph3 - mode
	image1 - mode
	infrared0 - mode
	infrared2 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	Star7 - direction
	GroundStation0 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image1)
	(supports instrument0 infrared2)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon12)
)
(:goal (and
	(have_image Phenomenon8 infrared2)
	(have_image Phenomenon9 infrared2)
	(have_image Star10 infrared0)
	(have_image Phenomenon11 image1)
	(have_image Phenomenon12 thermograph3)
))

)
