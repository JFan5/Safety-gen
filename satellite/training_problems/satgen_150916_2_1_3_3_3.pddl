; params: satgen 150916 2 1 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	image2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 spectrograph1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Star0)
	(pointing satellite1 Star5)
	(have_image Star3 spectrograph1)
	(have_image Star4 spectrograph0)
	(have_image Star5 image2)
))

)
