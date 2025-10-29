; params: satgen 820554 1 3 2 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Planet3 image1)
	(have_image Phenomenon4 image1)
	(have_image Phenomenon5 thermograph0)
	(have_image Phenomenon6 thermograph0)
	(have_image Phenomenon7 thermograph0)
))

)
