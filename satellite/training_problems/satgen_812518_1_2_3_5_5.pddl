; params: satgen 812518 1 2 3 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph2 - mode
	thermograph0 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation0 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(have_image Planet5 thermograph2)
	(have_image Phenomenon6 thermograph1)
	(have_image Star7 thermograph2)
	(have_image Phenomenon8 thermograph0)
	(have_image Star9 thermograph0)
))

)
