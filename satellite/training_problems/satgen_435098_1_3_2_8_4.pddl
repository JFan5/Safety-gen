; params: satgen 435098 1 3 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image0 - mode
	image1 - mode
	Star1 - direction
	Star4 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Star0 - direction
	Star3 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 image0)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 image0)
	(supports instrument2 image1)
	(calibration_target instrument2 Star3)
	(calibration_target instrument2 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet9)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Star8 image1)
	(have_image Planet9 image0)
	(have_image Star10 image1)
	(have_image Star11 image1)
))

)
