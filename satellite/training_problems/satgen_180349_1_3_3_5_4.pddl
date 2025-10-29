; params: satgen 180349 1 3 3 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph2 - mode
	thermograph0 - mode
	thermograph1 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(pointing satellite0 GroundStation4)
	(have_image Star5 thermograph0)
	(have_image Star6 spectrograph2)
	(have_image Phenomenon7 thermograph0)
	(have_image Phenomenon8 thermograph0)
))

)
