; params: satgen 190723 1 1 2 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	infrared1 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation1 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Star4 spectrograph0)
	(have_image Planet5 infrared1)
))

)
