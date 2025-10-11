; params: satgen 369122 2 3 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	image0 - mode
	image2 - mode
	image1 - mode
	Star1 - direction
	Star5 - direction
	Star6 - direction
	GroundStation4 - direction
	GroundStation7 - direction
	Star0 - direction
	Star2 - direction
	Star3 - direction
	Star8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
	Star12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star3)
	(supports instrument1 image2)
	(supports instrument1 image1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation4)
	(supports instrument2 image1)
	(supports instrument2 image0)
	(supports instrument2 image2)
	(calibration_target instrument2 Star0)
	(calibration_target instrument2 GroundStation7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument3 image1)
	(supports instrument3 image2)
	(supports instrument3 image0)
	(calibration_target instrument3 Star3)
	(supports instrument4 image2)
	(calibration_target instrument4 Star3)
	(calibration_target instrument4 Star2)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 Star1)
	(pointing satellite1 Star12)
	(have_image Star8 image1)
	(have_image Star9 image0)
	(have_image Planet10 image0)
	(have_image Star11 image1)
	(have_image Star12 image2)
	(have_image Phenomenon13 image2)
))

)
