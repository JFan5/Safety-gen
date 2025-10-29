; params: satgen 214588 1 3 2 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	image0 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet9)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Phenomenon4 spectrograph1)
	(have_image Planet5 spectrograph1)
	(have_image Star6 image0)
	(have_image Planet7 spectrograph1)
	(have_image Star8 image0)
	(have_image Planet9 image0)
))

)
