; params: satgen 694413 1 1 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	infrared2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(have_image Phenomenon4 spectrograph0)
	(have_image Star5 infrared2)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 spectrograph0)
))

)
