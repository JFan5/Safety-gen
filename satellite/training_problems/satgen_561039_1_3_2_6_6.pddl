; params: satgen 561039 1 3 2 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Planet6 thermograph0)
	(have_image Phenomenon7 thermograph0)
	(have_image Phenomenon8 infrared1)
	(have_image Star9 infrared1)
	(have_image Star10 thermograph0)
	(have_image Phenomenon11 thermograph0)
))

)
