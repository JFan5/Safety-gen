; params: satgen 265536 1 2 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	image2 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Star3 thermograph1)
	(have_image Star4 image2)
	(have_image Star5 thermograph1)
))

)
