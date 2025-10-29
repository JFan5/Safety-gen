; params: satgen 351617 1 2 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image3 - mode
	image1 - mode
	infrared2 - mode
	image0 - mode
	Star1 - direction
	GroundStation0 - direction
	Star2 - direction
	Phenomenon3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 image1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image3)
	(supports instrument1 image0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Phenomenon3 infrared2)
	(have_image Star4 image1)
	(have_image Star5 image1)
	(have_image Star6 infrared2)
	(have_image Phenomenon7 infrared2)
	(have_image Planet8 image1)
))

)
