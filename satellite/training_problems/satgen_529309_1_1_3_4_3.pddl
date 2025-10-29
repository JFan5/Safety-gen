; params: satgen 529309 1 1 3 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	thermograph2 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star2 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Planet4 thermograph2)
	(have_image Star5 thermograph2)
	(have_image Planet6 spectrograph0)
))

)
