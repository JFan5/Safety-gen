; params: satgen 471132 2 1 2 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	infrared0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star3 infrared0)
	(have_image Phenomenon4 infrared1)
	(have_image Planet5 infrared1)
	(have_image Star6 infrared1)
	(have_image Planet7 infrared1)
))

)
