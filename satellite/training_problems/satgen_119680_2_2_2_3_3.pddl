; params: satgen 119680 2 2 2 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	thermograph1 - mode
	Star2 - direction
	Star1 - direction
	GroundStation0 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon3)
	(supports instrument1 thermograph1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite1 Star2)
	(have_image Phenomenon3 thermograph0)
	(have_image Planet4 thermograph1)
	(have_image Planet5 thermograph1)
))

)
