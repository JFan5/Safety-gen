; params: satgen 311588 1 2 2 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph1 - mode
	thermograph0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
)
(:goal (and
	(have_image Star3 thermograph1)
	(have_image Planet4 thermograph0)
	(have_image Star5 thermograph1)
	(have_image Star6 thermograph0)
	(have_image Planet7 thermograph0)
))

)
