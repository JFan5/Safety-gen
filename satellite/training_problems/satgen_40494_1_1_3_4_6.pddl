; params: satgen 40494 1 1 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	infrared0 - mode
	thermograph2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
)
(:goal (and
	(have_image Planet4 infrared0)
	(have_image Star5 infrared1)
	(have_image Phenomenon6 thermograph2)
	(have_image Phenomenon7 thermograph2)
	(have_image Planet8 infrared0)
	(have_image Star9 thermograph2)
))

)
