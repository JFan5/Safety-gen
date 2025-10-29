; params: satgen 814608 2 2 2 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	image1 - mode
	Star0 - direction
	GroundStation2 - direction
	Star1 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 image1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon6)
)
(:goal (and
	(pointing satellite0 Star1)
	(pointing satellite1 Phenomenon3)
	(have_image Phenomenon3 thermograph0)
	(have_image Planet4 thermograph0)
	(have_image Phenomenon5 thermograph0)
	(have_image Phenomenon6 thermograph0)
	(have_image Star7 thermograph0)
))

)
