; params: satgen 573663 1 1 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	thermograph2 - mode
	infrared3 - mode
	infrared0 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation3 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Phenomenon5 infrared3)
	(have_image Star6 spectrograph1)
	(have_image Planet7 infrared3)
	(have_image Star8 infrared3)
))

)
