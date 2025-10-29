; params: satgen 533144 1 3 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image1 - mode
	thermograph0 - mode
	infrared3 - mode
	image2 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star0 - direction
	Star4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(supports instrument1 infrared3)
	(supports instrument1 image1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star0)
	(supports instrument2 image1)
	(supports instrument2 infrared3)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Phenomenon5 infrared3)
	(have_image Planet6 thermograph0)
	(have_image Planet7 infrared3)
	(have_image Star8 infrared3)
	(have_image Star9 infrared3)
	(have_image Planet10 thermograph0)
))

)
