; params: satgen 286442 1 1 2 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star1 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(have_image Star4 spectrograph1)
	(have_image Star5 spectrograph1)
	(have_image Planet6 image0)
	(have_image Star7 image0)
	(have_image Phenomenon8 spectrograph1)
	(have_image Planet9 image0)
))

)
