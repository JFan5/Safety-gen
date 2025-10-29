; params: satgen 223684 1 2 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph1 - mode
	thermograph0 - mode
	thermograph2 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph1)
	(supports instrument1 thermograph2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(have_image Phenomenon3 thermograph1)
	(have_image Star4 thermograph0)
	(have_image Star5 thermograph1)
))

)
