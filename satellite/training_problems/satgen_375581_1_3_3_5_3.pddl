; params: satgen 375581 1 3 3 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	thermograph1 - mode
	infrared0 - mode
	Star2 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image2)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 thermograph1)
	(supports instrument2 image2)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(pointing satellite0 Phenomenon7)
	(have_image Planet5 infrared0)
	(have_image Phenomenon6 thermograph1)
	(have_image Phenomenon7 infrared0)
))

)
