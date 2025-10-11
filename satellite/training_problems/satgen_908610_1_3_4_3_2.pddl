; params: satgen 908610 1 3 4 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	image2 - mode
	thermograph3 - mode
	infrared1 - mode
	Star0 - direction
	Star2 - direction
	Star1 - direction
	Star3 - direction
	Phenomenon4 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star1)
	(supports instrument1 image2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star2)
	(supports instrument2 thermograph3)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(pointing satellite0 Phenomenon4)
	(have_image Star3 thermograph0)
	(have_image Phenomenon4 image2)
))

)
