; params: satgen 602424 2 2 3 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph2 - mode
	spectrograph1 - mode
	infrared0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star0 - direction
	Planet4 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star3)
	(supports instrument3 thermograph2)
	(supports instrument3 infrared0)
	(calibration_target instrument3 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Planet7)
	(have_image Planet4 spectrograph1)
	(have_image Planet5 spectrograph1)
	(have_image Planet6 thermograph2)
	(have_image Planet7 spectrograph1)
	(have_image Phenomenon8 infrared0)
))

)
