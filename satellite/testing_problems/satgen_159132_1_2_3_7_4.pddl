; params: satgen 159132 1 2 3 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	infrared0 - mode
	image2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation5 - direction
	Star6 - direction
	Star4 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star10)
)
(:goal (and
	(have_image Phenomenon7 spectrograph1)
	(have_image Planet8 image2)
	(have_image Star9 image2)
	(have_image Star10 image2)
))

)
