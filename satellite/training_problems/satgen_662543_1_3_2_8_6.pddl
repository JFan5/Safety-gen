; params: satgen 662543 1 3 2 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image0 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star3 - direction
	Star0 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Star11 - direction
	Planet12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 GroundStation7)
	(supports instrument1 image1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star0)
	(supports instrument2 image1)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation4)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Star8 image1)
	(have_image Phenomenon9 image1)
	(have_image Planet10 image1)
	(have_image Star11 image1)
	(have_image Planet12 image0)
	(have_image Star13 image0)
))

)
