; params: satgen 271118 1 2 2 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation3 - direction
	Star0 - direction
	GroundStation2 - direction
	Star4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(supports instrument1 spectrograph1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Planet8)
	(have_image Star4 infrared0)
	(have_image Phenomenon5 infrared0)
	(have_image Planet6 infrared0)
	(have_image Phenomenon7 infrared0)
	(have_image Planet8 infrared0)
	(have_image Star9 infrared0)
))

)
