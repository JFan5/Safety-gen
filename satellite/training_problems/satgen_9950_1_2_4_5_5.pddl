; params: satgen 9950 1 2 4 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	spectrograph1 - mode
	infrared3 - mode
	image2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star4 - direction
	Star2 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(have_image Star5 spectrograph1)
	(have_image Planet6 image0)
	(have_image Phenomenon7 image0)
	(have_image Planet8 image2)
	(have_image Star9 spectrograph1)
))

)
