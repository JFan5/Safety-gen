; params: satgen 278232 2 1 3 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	thermograph1 - mode
	infrared0 - mode
	Star0 - direction
	Star2 - direction
	Star5 - direction
	GroundStation6 - direction
	Star1 - direction
	GroundStation3 - direction
	Star4 - direction
	Phenomenon7 - direction
	Star8 - direction
	Planet9 - direction
	Planet10 - direction
	Star11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star11)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(supports instrument1 image2)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(have_image Phenomenon7 image2)
	(have_image Star8 infrared0)
	(have_image Planet9 image2)
	(have_image Planet10 image2)
	(have_image Star11 image2)
	(have_image Star12 thermograph1)
))

)
