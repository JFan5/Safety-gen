; params: satgen 604398 1 3 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared1 - mode
	thermograph0 - mode
	infrared3 - mode
	image2 - mode
	Star0 - direction
	Star3 - direction
	Star2 - direction
	GroundStation4 - direction
	Star1 - direction
	Star5 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
	Planet9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star3)
	(supports instrument1 thermograph0)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation4)
	(calibration_target instrument1 Star2)
	(supports instrument2 infrared3)
	(calibration_target instrument2 Star5)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Star6 image2)
	(have_image Planet7 infrared3)
	(have_image Planet8 image2)
	(have_image Planet9 infrared1)
	(have_image Planet10 image2)
	(have_image Star11 thermograph0)
))

)
