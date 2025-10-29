; params: satgen 436134 1 1 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	thermograph1 - mode
	spectrograph2 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star7 - direction
	GroundStation6 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
	Phenomenon11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet10)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Phenomenon8 infrared0)
	(have_image Planet9 infrared0)
	(have_image Planet10 thermograph1)
	(have_image Phenomenon11 infrared0)
	(have_image Star12 spectrograph2)
))

)
