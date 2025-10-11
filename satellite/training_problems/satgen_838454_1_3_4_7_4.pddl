; params: satgen 838454 1 3 4 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	thermograph3 - mode
	thermograph0 - mode
	image1 - mode
	Star2 - direction
	Star4 - direction
	Star6 - direction
	Star1 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Star5 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 Star1)
	(supports instrument1 image2)
	(supports instrument1 image1)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 thermograph3)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star5)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(pointing satellite0 Planet10)
	(have_image Phenomenon7 image1)
	(have_image Star8 image1)
	(have_image Star9 thermograph3)
	(have_image Planet10 image2)
))

)
