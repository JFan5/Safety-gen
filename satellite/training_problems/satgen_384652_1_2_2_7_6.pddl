; params: satgen 384652 1 2 2 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation6 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon12)
)
(:goal (and
	(have_image Planet7 thermograph1)
	(have_image Phenomenon8 thermograph1)
	(have_image Star9 thermograph1)
	(have_image Planet10 thermograph0)
	(have_image Star11 thermograph0)
	(have_image Phenomenon12 thermograph0)
))

)
