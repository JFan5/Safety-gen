; params: satgen 425394 1 3 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	infrared3 - mode
	infrared2 - mode
	infrared0 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star0 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared3)
	(supports instrument0 infrared0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Star4 infrared2)
	(have_image Planet5 infrared3)
))

)
