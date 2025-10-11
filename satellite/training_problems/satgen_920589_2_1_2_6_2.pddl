; params: satgen 920589 2 1 2 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	image0 - mode
	Star0 - direction
	Star3 - direction
	Star4 - direction
	Star2 - direction
	Star5 - direction
	GroundStation1 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Planet6 image0)
	(have_image Phenomenon7 image1)
))

)
