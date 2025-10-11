; params: satgen 124428 1 2 2 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	image0 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(supports instrument1 spectrograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Phenomenon3 spectrograph1)
	(have_image Planet4 spectrograph1)
	(have_image Star5 spectrograph1)
	(have_image Star6 spectrograph1)
))

)
