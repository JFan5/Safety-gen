; params: satgen 26067 1 3 3 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	image0 - mode
	spectrograph2 - mode
	Star1 - direction
	GroundStation2 - direction
	Star4 - direction
	Star0 - direction
	Star3 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph2)
	(supports instrument0 image0)
	(calibration_target instrument0 Star3)
	(supports instrument1 image0)
	(calibration_target instrument1 Star0)
	(supports instrument2 spectrograph1)
	(supports instrument2 image0)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Planet5 spectrograph1)
	(have_image Phenomenon6 spectrograph1)
	(have_image Star7 spectrograph2)
))

)
