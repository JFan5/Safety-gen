; params: satgen 290919 1 1 2 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	Star4 - direction
	GroundStation3 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Star5 thermograph0)
	(have_image Star6 thermograph0)
	(have_image Star7 infrared1)
	(have_image Phenomenon8 infrared1)
	(have_image Star9 infrared1)
))

)
