; params: satgen 981583 2 2 3 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	infrared1 - mode
	image0 - mode
	GroundStation2 - direction
	Star3 - direction
	Star1 - direction
	Star0 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 infrared2)
	(supports instrument1 image0)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite1 Star3)
	(have_image Star4 infrared1)
	(have_image Planet5 image0)
))

)
