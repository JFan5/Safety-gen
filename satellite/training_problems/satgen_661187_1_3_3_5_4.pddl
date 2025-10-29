; params: satgen 661187 1 3 3 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	image0 - mode
	image2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star3 - direction
	Star4 - direction
	GroundStation2 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Planet5 image0)
	(have_image Phenomenon6 image2)
	(have_image Planet7 image2)
	(have_image Phenomenon8 image0)
))

)
