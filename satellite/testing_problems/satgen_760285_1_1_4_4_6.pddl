; params: satgen 760285 1 1 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image3 - mode
	spectrograph0 - mode
	infrared1 - mode
	infrared2 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation0 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
)
(:goal (and
	(pointing satellite0 Planet8)
	(have_image Phenomenon4 spectrograph0)
	(have_image Planet5 image3)
	(have_image Phenomenon6 infrared2)
	(have_image Star7 infrared2)
	(have_image Planet8 infrared2)
	(have_image Star9 infrared2)
))

)
