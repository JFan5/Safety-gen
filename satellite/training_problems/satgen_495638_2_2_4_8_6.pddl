; params: satgen 495638 2 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph0 - mode
	thermograph2 - mode
	spectrograph1 - mode
	infrared3 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star7 - direction
	Star6 - direction
	Star1 - direction
	GroundStation5 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Planet12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star6)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet12)
	(supports instrument2 infrared3)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(pointing satellite1 Phenomenon11)
	(have_image Phenomenon8 infrared3)
	(have_image Star9 thermograph2)
	(have_image Star10 spectrograph1)
	(have_image Phenomenon11 infrared3)
	(have_image Planet12 thermograph2)
	(have_image Planet13 infrared3)
))

)
