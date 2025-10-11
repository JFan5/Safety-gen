; params: satgen 792984 1 2 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph3 - mode
	thermograph1 - mode
	image0 - mode
	image2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	Star5 - direction
	Star3 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph3)
	(supports instrument0 image0)
	(supports instrument0 image2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(have_image Phenomenon6 spectrograph3)
	(have_image Star7 image0)
	(have_image Planet8 image2)
	(have_image Star9 thermograph1)
	(have_image Planet10 thermograph1)
))

)
