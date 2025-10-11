; params: satgen 888258 2 3 2 4 2
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
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	Phenomenon4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 infrared0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(have_image Phenomenon4 image1)
	(have_image Planet5 image1)
))

)
