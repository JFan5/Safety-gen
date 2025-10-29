; params: satgen 876300 1 1 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph3 - mode
	image2 - mode
	infrared1 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation0 - direction
	Star4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(have_image Star4 image2)
	(have_image Phenomenon5 infrared1)
	(have_image Star6 infrared1)
	(have_image Planet7 infrared0)
	(have_image Phenomenon8 infrared0)
	(have_image Planet9 spectrograph3)
))

)
