; params: satgen 361128 2 2 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	spectrograph2 - mode
	image0 - mode
	Star2 - direction
	Star1 - direction
	Star0 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Star3 spectrograph1)
	(have_image Planet4 spectrograph2)
	(have_image Phenomenon5 image0)
	(have_image Star6 spectrograph1)
	(have_image Planet7 spectrograph1)
	(have_image Star8 spectrograph2)
))

)
