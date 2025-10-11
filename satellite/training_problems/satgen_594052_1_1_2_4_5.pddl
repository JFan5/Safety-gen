; params: satgen 594052 1 1 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	Star1 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star4 image1)
	(have_image Planet5 spectrograph0)
	(have_image Planet6 spectrograph0)
	(have_image Planet7 image1)
	(have_image Planet8 spectrograph0)
))

)
