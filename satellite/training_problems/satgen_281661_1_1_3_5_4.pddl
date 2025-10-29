; params: satgen 281661 1 1 3 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	thermograph1 - mode
	infrared2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation4 - direction
	Star3 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Phenomenon5 thermograph1)
	(have_image Planet6 infrared0)
	(have_image Star7 infrared0)
	(have_image Planet8 thermograph1)
))

)
