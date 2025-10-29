; params: satgen 799540 2 1 2 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	image0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Phenomenon4 image0)
	(have_image Phenomenon5 image0)
	(have_image Star6 image0)
	(have_image Planet7 infrared1)
))

)
