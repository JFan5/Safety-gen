; params: satgen 73088 1 2 3 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	thermograph2 - mode
	thermograph1 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Phenomenon5 thermograph1)
	(have_image Star6 infrared0)
	(have_image Star7 thermograph1)
	(have_image Star8 thermograph2)
	(have_image Phenomenon9 thermograph2)
))

)
