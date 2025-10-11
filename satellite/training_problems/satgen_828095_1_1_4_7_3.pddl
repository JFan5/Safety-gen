; params: satgen 828095 1 1 4 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	image3 - mode
	image0 - mode
	infrared2 - mode
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation6 - direction
	Star5 - direction
	GroundStation0 - direction
	Star7 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 GroundStation6)
	(have_image Star7 image1)
	(have_image Phenomenon8 image1)
	(have_image Planet9 infrared2)
))

)
