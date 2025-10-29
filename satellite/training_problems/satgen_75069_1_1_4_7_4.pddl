; params: satgen 75069 1 1 4 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph2 - mode
	spectrograph1 - mode
	infrared0 - mode
	spectrograph3 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation2 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
)
(:goal (and
	(pointing satellite0 Phenomenon7)
	(have_image Phenomenon7 infrared0)
	(have_image Phenomenon8 spectrograph1)
	(have_image Star9 spectrograph3)
	(have_image Planet10 spectrograph3)
))

)
