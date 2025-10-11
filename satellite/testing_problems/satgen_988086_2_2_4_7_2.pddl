; params: satgen 988086 2 2 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	image1 - mode
	image3 - mode
	image0 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation4 - direction
	Star5 - direction
	Star6 - direction
	Star3 - direction
	Star2 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument1 image1)
	(supports instrument1 image3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(pointing satellite0 GroundStation4)
	(have_image Star7 infrared2)
	(have_image Star8 image0)
))

)
