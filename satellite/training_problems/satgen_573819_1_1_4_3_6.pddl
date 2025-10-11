; params: satgen 573819 1 1 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	spectrograph2 - mode
	spectrograph3 - mode
	spectrograph0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(have_image Star3 spectrograph1)
	(have_image Star4 spectrograph3)
	(have_image Phenomenon5 spectrograph0)
	(have_image Planet6 spectrograph2)
	(have_image Phenomenon7 spectrograph2)
	(have_image Phenomenon8 spectrograph1)
))

)
