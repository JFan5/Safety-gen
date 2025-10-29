; params: satgen 371217 1 3 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation0 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
)
(:goal (and
	(have_image Star4 spectrograph0)
	(have_image Planet5 spectrograph1)
	(have_image Planet6 spectrograph0)
	(have_image Star7 spectrograph0)
	(have_image Planet8 spectrograph1)
))

)
