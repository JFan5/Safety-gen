; params: satgen 865557 1 3 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph0 - mode
	infrared2 - mode
	infrared1 - mode
	Star1 - direction
	Star2 - direction
	Star0 - direction
	Planet3 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
)
(:goal (and
	(have_image Planet3 infrared1)
	(have_image Star4 infrared2)
	(have_image Planet5 infrared2)
	(have_image Planet6 spectrograph0)
	(have_image Star7 infrared2)
	(have_image Phenomenon8 infrared2)
))

)
