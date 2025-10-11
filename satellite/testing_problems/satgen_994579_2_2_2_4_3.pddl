; params: satgen 994579 2 2 2 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image1 - mode
	image0 - mode
	GroundStation3 - direction
	Star1 - direction
	Star2 - direction
	Star0 - direction
	Phenomenon4 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument1 image1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(supports instrument2 image1)
	(calibration_target instrument2 Star0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(pointing satellite1 Star2)
	(have_image Phenomenon4 image1)
	(have_image Star5 image1)
	(have_image Phenomenon6 image1)
))

)
