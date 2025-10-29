; params: satgen 37000 1 3 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	thermograph2 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Planet3 infrared0)
	(have_image Star4 infrared0)
	(have_image Star5 thermograph1)
))

)
