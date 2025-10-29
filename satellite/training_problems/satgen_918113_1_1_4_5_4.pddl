; params: satgen 918113 1 1 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image3 - mode
	infrared0 - mode
	thermograph2 - mode
	spectrograph1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation1 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph2)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Phenomenon5 image3)
	(have_image Phenomenon6 infrared0)
	(have_image Phenomenon7 thermograph2)
	(have_image Planet8 spectrograph1)
))

)
