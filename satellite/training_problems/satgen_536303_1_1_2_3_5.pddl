; params: satgen 536303 1 1 2 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	infrared1 - mode
	Star0 - direction
	Star2 - direction
	Star1 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(have_image Planet3 spectrograph0)
	(have_image Phenomenon4 spectrograph0)
	(have_image Planet5 spectrograph0)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 infrared1)
))

)
