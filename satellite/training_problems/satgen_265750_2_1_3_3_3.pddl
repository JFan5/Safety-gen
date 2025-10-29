; params: satgen 265750 2 1 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	infrared2 - mode
	thermograph1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Star3)
	(have_image Star3 thermograph1)
	(have_image Planet4 image0)
	(have_image Phenomenon5 infrared2)
))

)
