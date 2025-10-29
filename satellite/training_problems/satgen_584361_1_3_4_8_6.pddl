; params: satgen 584361 1 3 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	infrared0 - mode
	infrared3 - mode
	image1 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star1 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Phenomenon12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 infrared3)
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation6)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Planet8 infrared3)
	(have_image Star9 spectrograph2)
	(have_image Star10 spectrograph2)
	(have_image Phenomenon11 spectrograph2)
	(have_image Phenomenon12 infrared3)
	(have_image Phenomenon13 image1)
))

)
