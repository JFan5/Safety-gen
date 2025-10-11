; params: satgen 340055 2 1 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	image2 - mode
	thermograph1 - mode
	GroundStation2 - direction
	Star1 - direction
	GroundStation0 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 Phenomenon3)
	(have_image Phenomenon3 image0)
	(have_image Phenomenon4 image0)
	(have_image Planet5 image2)
	(have_image Star6 image2)
	(have_image Star7 thermograph1)
	(have_image Star8 image0)
))

)
