; params: satgen 443802 1 1 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	spectrograph2 - mode
	thermograph1 - mode
	GroundStation1 - direction
	Star2 - direction
	Star0 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(pointing satellite0 Planet4)
	(have_image Phenomenon3 infrared0)
	(have_image Planet4 infrared0)
	(have_image Phenomenon5 spectrograph2)
	(have_image Star6 spectrograph2)
	(have_image Star7 thermograph1)
	(have_image Planet8 infrared0)
))

)
