; params: satgen 177168 1 3 3 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image0 - mode
	infrared2 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image0)
	(supports instrument1 infrared2)
	(supports instrument1 image1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Star3 image0)
	(have_image Star4 image0)
	(have_image Planet5 infrared2)
	(have_image Star6 image1)
))

)
