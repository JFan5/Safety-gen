; params: satgen 17497 1 1 4 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph2 - mode
	thermograph3 - mode
	spectrograph1 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation1 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph3)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Phenomenon4 thermograph3)
	(have_image Phenomenon5 spectrograph1)
	(have_image Phenomenon6 thermograph3)
	(have_image Star7 infrared0)
	(have_image Star8 infrared0)
))

)
