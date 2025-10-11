; params: satgen 360526 1 2 4 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph3 - mode
	infrared1 - mode
	spectrograph0 - mode
	image2 - mode
	Star0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star4 - direction
	GroundStation6 - direction
	Star2 - direction
	GroundStation5 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 spectrograph0)
	(supports instrument0 image2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(have_image Phenomenon7 infrared1)
	(have_image Phenomenon8 spectrograph0)
	(have_image Star9 infrared1)
	(have_image Planet10 spectrograph0)
	(have_image Phenomenon11 spectrograph0)
))

)
