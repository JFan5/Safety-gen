; params: satgen 844245 2 2 3 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	thermograph2 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 thermograph2)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 thermograph2)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet4)
)
(:goal (and
	(have_image Planet4 spectrograph1)
	(have_image Star5 spectrograph1)
	(have_image Planet6 thermograph0)
	(have_image Planet7 spectrograph1)
	(have_image Star8 spectrograph1)
))

)
