; params: satgen 782113 1 3 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image1 - mode
	image0 - mode
	infrared3 - mode
	thermograph2 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star0 - direction
	Planet4 - direction
	Planet5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 Star0)
	(supports instrument1 thermograph2)
	(supports instrument1 image0)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
)
(:goal (and
	(have_image Planet4 infrared3)
	(have_image Planet5 thermograph2)
	(have_image Phenomenon6 image1)
))

)
