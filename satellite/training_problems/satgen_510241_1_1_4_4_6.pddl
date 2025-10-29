; params: satgen 510241 1 1 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	infrared1 - mode
	thermograph2 - mode
	thermograph3 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph3)
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
)
(:goal (and
	(pointing satellite0 Phenomenon5)
	(have_image Phenomenon4 thermograph0)
	(have_image Phenomenon5 infrared1)
	(have_image Phenomenon6 infrared1)
	(have_image Star7 thermograph0)
	(have_image Star8 thermograph0)
	(have_image Star9 thermograph0)
))

)
