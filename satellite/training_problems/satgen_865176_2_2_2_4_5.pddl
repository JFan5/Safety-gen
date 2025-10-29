; params: satgen 865176 2 2 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	infrared0 - mode
	Star0 - direction
	Star3 - direction
	GroundStation2 - direction
	Star1 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Phenomenon4 infrared1)
	(have_image Planet5 infrared0)
	(have_image Star6 infrared1)
	(have_image Phenomenon7 infrared1)
	(have_image Star8 infrared0)
))

)
