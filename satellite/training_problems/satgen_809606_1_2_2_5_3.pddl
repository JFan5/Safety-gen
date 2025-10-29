; params: satgen 809606 1 2 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Planet5 image0)
	(have_image Planet6 image0)
	(have_image Star7 infrared1)
))

)
