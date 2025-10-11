; params: satgen 90995 1 2 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation0 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Phenomenon4 spectrograph0)
	(have_image Planet5 image1)
	(have_image Planet6 spectrograph0)
	(have_image Star7 image1)
	(have_image Planet8 spectrograph0)
))

)
