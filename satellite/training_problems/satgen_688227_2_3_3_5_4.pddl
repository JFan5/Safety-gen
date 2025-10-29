; params: satgen 688227 2 3 3 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	thermograph2 - mode
	infrared0 - mode
	thermograph1 - mode
	GroundStation1 - direction
	GroundStation4 - direction
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star0)
	(supports instrument2 infrared0)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument3 infrared0)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 Star2)
	(supports instrument4 thermograph1)
	(supports instrument4 infrared0)
	(supports instrument4 thermograph2)
	(calibration_target instrument4 GroundStation3)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(have_image Star5 thermograph1)
	(have_image Phenomenon6 thermograph1)
	(have_image Star7 thermograph1)
	(have_image Planet8 thermograph2)
))

)
