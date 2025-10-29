; params: satgen 714370 2 1 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star6 - direction
	Star2 - direction
	Star4 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 infrared0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star7)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Phenomenon8 infrared0)
	(have_image Star9 image1)
	(have_image Phenomenon10 image1)
))

)
