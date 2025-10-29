; params: satgen 938794 1 2 4 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph2 - mode
	spectrograph3 - mode
	image1 - mode
	Star1 - direction
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	Planet4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
)
(:goal (and
	(have_image Star3 image1)
	(have_image Planet4 spectrograph2)
	(have_image Star5 spectrograph0)
))

)
