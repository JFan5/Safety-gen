; params: satgen 553755 2 2 3 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	spectrograph1 - mode
	thermograph2 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation1 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph2)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite1 Star9)
	(have_image Phenomenon6 infrared0)
	(have_image Planet7 infrared0)
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph1)
	(have_image Star10 spectrograph1)
	(have_image Phenomenon11 spectrograph1)
))

)
