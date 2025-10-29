; params: satgen 361893 2 2 2 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star0 - direction
	GroundStation6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet10)
	(supports instrument1 spectrograph1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation6)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet10)
)
(:goal (and
	(have_image Star7 infrared0)
	(have_image Phenomenon8 infrared0)
	(have_image Star9 spectrograph1)
	(have_image Planet10 infrared0)
	(have_image Star11 spectrograph1)
))

)
