; params: satgen 590717 1 2 2 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	thermograph1 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(pointing satellite0 Star9)
	(have_image Star6 thermograph0)
	(have_image Star7 thermograph0)
	(have_image Phenomenon8 thermograph1)
	(have_image Star9 thermograph0)
))

)
