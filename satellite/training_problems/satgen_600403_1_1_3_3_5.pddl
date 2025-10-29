; params: satgen 600403 1 1 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	image1 - mode
	spectrograph2 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
)
(:goal (and
	(have_image Planet3 spectrograph2)
	(have_image Phenomenon4 spectrograph2)
	(have_image Planet5 spectrograph2)
	(have_image Planet6 spectrograph2)
	(have_image Star7 spectrograph2)
))

)
