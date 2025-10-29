; params: satgen 96320 2 2 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared0 - mode
	thermograph1 - mode
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	GroundStation0 - direction
	Phenomenon4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 infrared0)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Phenomenon4 thermograph1)
	(have_image Star5 infrared0)
	(have_image Planet6 thermograph1)
	(have_image Phenomenon7 infrared0)
	(have_image Phenomenon8 infrared0)
))

)
