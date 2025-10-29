; params: satgen 109982 1 1 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	thermograph2 - mode
	thermograph0 - mode
	spectrograph3 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Star5 thermograph0)
	(have_image Phenomenon6 thermograph1)
	(have_image Star7 spectrograph3)
))

)
