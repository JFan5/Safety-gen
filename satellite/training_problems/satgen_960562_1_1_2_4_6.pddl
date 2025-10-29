; params: satgen 960562 1 1 2 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star0 - direction
	Star4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Star4 thermograph1)
	(have_image Phenomenon5 thermograph0)
	(have_image Star6 thermograph0)
	(have_image Planet7 thermograph1)
	(have_image Phenomenon8 thermograph1)
	(have_image Star9 thermograph0)
))

)
