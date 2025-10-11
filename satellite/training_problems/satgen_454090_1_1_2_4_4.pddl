; params: satgen 454090 1 1 2 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	spectrograph1 - mode
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
)
(:goal (and
	(have_image Star4 spectrograph1)
	(have_image Planet5 infrared0)
	(have_image Star6 infrared0)
	(have_image Star7 spectrograph1)
))

)
