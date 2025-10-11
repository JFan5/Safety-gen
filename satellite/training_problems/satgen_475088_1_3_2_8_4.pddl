; params: satgen 475088 1 3 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image0 - mode
	image1 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation6 - direction
	Star7 - direction
	Star5 - direction
	GroundStation3 - direction
	Star4 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star5)
	(supports instrument1 image1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 image1)
	(supports instrument2 image0)
	(calibration_target instrument2 Star4)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(pointing satellite0 Star9)
	(have_image Star8 image1)
	(have_image Star9 image1)
	(have_image Star10 image0)
	(have_image Star11 image0)
))

)
