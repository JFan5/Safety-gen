; params: satgen 352587 1 2 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	infrared1 - mode
	infrared2 - mode
	thermograph3 - mode
	Star1 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph3)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Star6 infrared0)
	(have_image Star7 infrared0)
	(have_image Planet8 thermograph3)
	(have_image Planet9 infrared1)
	(have_image Phenomenon10 thermograph3)
	(have_image Phenomenon11 infrared2)
))

)
