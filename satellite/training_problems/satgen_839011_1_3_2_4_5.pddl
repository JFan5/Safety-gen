; params: satgen 839011 1 3 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	infrared0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Star4 infrared0)
	(have_image Star5 infrared1)
	(have_image Planet6 infrared1)
	(have_image Star7 infrared1)
	(have_image Star8 infrared0)
))

)
