; params: satgen 480320 1 3 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	image0 - mode
	image2 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star1 - direction
	Planet3 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 image2)
	(supports instrument1 image0)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
)
(:goal (and
	(have_image Planet3 image0)
	(have_image Star4 image2)
	(have_image Planet5 spectrograph1)
))

)
