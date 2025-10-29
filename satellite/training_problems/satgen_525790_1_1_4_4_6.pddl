; params: satgen 525790 1 1 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	spectrograph3 - mode
	image0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation1 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph3)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Star4 image0)
	(have_image Phenomenon5 image0)
	(have_image Phenomenon6 infrared2)
	(have_image Star7 spectrograph1)
	(have_image Phenomenon8 spectrograph3)
	(have_image Planet9 spectrograph1)
))

)
