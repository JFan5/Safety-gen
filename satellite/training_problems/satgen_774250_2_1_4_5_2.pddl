; params: satgen 774250 2 1 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	image0 - mode
	infrared2 - mode
	infrared3 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared3)
	(supports instrument0 image0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 infrared3)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite1 Star0)
	(have_image Star5 image0)
	(have_image Phenomenon6 infrared2)
))

)
