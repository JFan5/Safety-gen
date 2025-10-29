; params: satgen 152750 1 2 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	image1 - mode
	thermograph2 - mode
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(have_image Planet4 image0)
	(have_image Star5 thermograph2)
	(have_image Planet6 image1)
	(have_image Phenomenon7 image0)
	(have_image Planet8 image1)
	(have_image Star9 image0)
))

)
