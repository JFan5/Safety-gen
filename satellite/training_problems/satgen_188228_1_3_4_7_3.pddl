; params: satgen 188228 1 3 4 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph3 - mode
	thermograph2 - mode
	infrared0 - mode
	image1 - mode
	Star2 - direction
	GroundStation6 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Star5 - direction
	Star3 - direction
	GroundStation0 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 thermograph2)
	(supports instrument2 thermograph3)
	(calibration_target instrument2 GroundStation0)
	(calibration_target instrument2 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Planet7 thermograph2)
	(have_image Planet8 thermograph3)
	(have_image Phenomenon9 thermograph3)
))

)
