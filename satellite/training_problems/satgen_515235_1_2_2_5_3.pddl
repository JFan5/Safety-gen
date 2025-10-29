; params: satgen 515235 1 2 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation3 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star4)
	(supports instrument1 image0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Star0)
	(have_image Planet5 spectrograph1)
	(have_image Star6 image0)
	(have_image Phenomenon7 spectrograph1)
))

)
