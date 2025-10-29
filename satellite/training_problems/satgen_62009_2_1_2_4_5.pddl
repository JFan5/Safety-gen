; params: satgen 62009 2 1 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation0 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(pointing satellite1 Star4)
	(have_image Star4 infrared0)
	(have_image Phenomenon5 infrared0)
	(have_image Phenomenon6 infrared0)
	(have_image Star7 infrared0)
	(have_image Phenomenon8 infrared0)
))

)
