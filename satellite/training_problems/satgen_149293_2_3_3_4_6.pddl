; params: satgen 149293 2 3 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph1 - mode
	infrared2 - mode
	infrared0 - mode
	Star3 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet4 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star3)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
	(supports instrument2 infrared2)
	(supports instrument2 infrared0)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation2)
	(supports instrument3 thermograph1)
	(supports instrument3 infrared0)
	(supports instrument3 infrared2)
	(calibration_target instrument3 GroundStation0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet5)
)
(:goal (and
	(have_image Planet4 infrared0)
	(have_image Planet5 thermograph1)
	(have_image Star6 infrared2)
	(have_image Star7 infrared2)
	(have_image Planet8 thermograph1)
	(have_image Star9 thermograph1)
))

)
