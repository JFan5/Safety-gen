; params: satgen 819851 1 2 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared2 - mode
	image3 - mode
	image0 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star2 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(supports instrument0 image3)
	(calibration_target instrument0 Star2)
	(supports instrument1 image3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(have_image Star4 image0)
	(have_image Star5 spectrograph1)
	(have_image Planet6 spectrograph1)
))

)
