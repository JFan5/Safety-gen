; params: satgen 767076 2 1 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph3 - mode
	thermograph1 - mode
	image2 - mode
	thermograph0 - mode
	GroundStation2 - direction
	Star0 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon3)
	(supports instrument1 spectrograph3)
	(supports instrument1 thermograph1)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(have_image Phenomenon3 thermograph1)
	(have_image Planet4 thermograph0)
	(have_image Star5 spectrograph3)
	(have_image Planet6 spectrograph3)
	(have_image Planet7 image2)
))

)
