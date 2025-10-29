; params: satgen 394741 1 2 3 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	infrared2 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(have_image Star6 thermograph1)
	(have_image Planet7 infrared2)
	(have_image Planet8 thermograph1)
))

)
