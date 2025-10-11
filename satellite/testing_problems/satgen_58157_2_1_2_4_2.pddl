; params: satgen 58157 2 1 2 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	image0 - mode
	Star1 - direction
	Star3 - direction
	Star2 - direction
	Star0 - direction
	Phenomenon4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(pointing satellite1 Phenomenon4)
	(have_image Phenomenon4 spectrograph1)
	(have_image Star5 spectrograph1)
))

)
