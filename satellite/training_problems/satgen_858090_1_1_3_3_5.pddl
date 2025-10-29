; params: satgen 858090 1 1 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Star3 spectrograph1)
	(have_image Planet4 infrared2)
	(have_image Phenomenon5 spectrograph1)
	(have_image Star6 spectrograph1)
	(have_image Planet7 infrared2)
))

)
