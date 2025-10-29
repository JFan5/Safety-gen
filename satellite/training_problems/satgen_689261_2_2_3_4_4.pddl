; params: satgen 689261 2 2 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	image1 - mode
	infrared0 - mode
	thermograph2 - mode
	GroundStation2 - direction
	Star1 - direction
	Star0 - direction
	GroundStation3 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 infrared0)
	(supports instrument2 image1)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(have_image Star4 thermograph2)
	(have_image Phenomenon5 thermograph2)
	(have_image Phenomenon6 image1)
	(have_image Star7 thermograph2)
))

)
