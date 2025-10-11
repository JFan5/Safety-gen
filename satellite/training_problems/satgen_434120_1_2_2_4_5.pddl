; params: satgen 434120 1 2 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	image0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation0 - direction
	Star4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star4 image0)
	(have_image Star5 image0)
	(have_image Phenomenon6 thermograph1)
	(have_image Planet7 thermograph1)
	(have_image Phenomenon8 image0)
))

)
