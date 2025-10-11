; params: satgen 555594 1 3 3 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image1 - mode
	infrared0 - mode
	thermograph2 - mode
	GroundStation4 - direction
	Star5 - direction
	Star2 - direction
	Star0 - direction
	GroundStation1 - direction
	Star3 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Planet9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star3)
	(supports instrument1 image1)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star0)
	(calibration_target instrument1 Star2)
	(supports instrument2 image1)
	(supports instrument2 infrared0)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star3)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(pointing satellite0 Planet10)
	(have_image Phenomenon6 thermograph2)
	(have_image Phenomenon7 image1)
	(have_image Planet8 image1)
	(have_image Planet9 thermograph2)
	(have_image Planet10 infrared0)
))

)
