; params: satgen 814393 1 2 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	image1 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Phenomenon4 thermograph0)
	(have_image Planet5 image1)
	(have_image Phenomenon6 image1)
	(have_image Phenomenon7 image1)
	(have_image Planet8 thermograph0)
))

)
