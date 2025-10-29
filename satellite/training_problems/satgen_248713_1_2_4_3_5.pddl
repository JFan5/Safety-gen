; params: satgen 248713 1 2 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	spectrograph3 - mode
	image2 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Planet4 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph0)
	(supports instrument1 image2)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
)
(:goal (and
	(have_image Star3 spectrograph0)
	(have_image Planet4 thermograph1)
	(have_image Planet5 thermograph1)
	(have_image Planet6 spectrograph3)
	(have_image Star7 thermograph1)
))

)
