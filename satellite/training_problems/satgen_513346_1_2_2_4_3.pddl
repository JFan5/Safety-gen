; params: satgen 513346 1 2 2 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	thermograph0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(have_image Planet4 thermograph0)
	(have_image Star5 thermograph0)
	(have_image Phenomenon6 thermograph0)
))

)
