; params: satgen 299917 1 2 3 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	thermograph1 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet3 - direction
	Phenomenon4 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet3 thermograph1)
	(have_image Phenomenon4 thermograph1)
))

)
