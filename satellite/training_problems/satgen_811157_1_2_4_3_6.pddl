; params: satgen 811157 1 2 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	image3 - mode
	thermograph2 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet3 - direction
	Planet4 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 thermograph2)
	(supports instrument1 image3)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet3)
)
(:goal (and
	(have_image Planet3 infrared0)
	(have_image Planet4 spectrograph1)
	(have_image Planet5 infrared0)
	(have_image Planet6 thermograph2)
	(have_image Planet7 infrared0)
	(have_image Star8 spectrograph1)
))

)
