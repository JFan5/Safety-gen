; params: satgen 124570 2 2 3 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image1 - mode
	image0 - mode
	thermograph2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star4 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Planet5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 image1)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(have_image Planet5 image1)
	(have_image Star6 image0)
	(have_image Planet7 image1)
))

)
