; params: satgen 787029 2 1 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	infrared1 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star3 - direction
	GroundStation0 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite1 Planet6)
	(have_image Star5 infrared1)
	(have_image Planet6 infrared1)
	(have_image Planet7 infrared1)
))

)
