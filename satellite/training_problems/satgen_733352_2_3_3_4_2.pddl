; params: satgen 733352 2 3 3 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	image2 - mode
	thermograph1 - mode
	image0 - mode
	Star0 - direction
	GroundStation3 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Phenomenon4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 thermograph1)
	(supports instrument1 image2)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation1)
	(supports instrument3 image0)
	(supports instrument3 thermograph1)
	(supports instrument3 image2)
	(calibration_target instrument3 GroundStation1)
	(supports instrument4 image0)
	(calibration_target instrument4 GroundStation2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(have_image Phenomenon4 thermograph1)
	(have_image Planet5 image2)
))

)
