; params: satgen 36284 1 2 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	infrared2 - mode
	image3 - mode
	image0 - mode
	GroundStation0 - direction
	Star1 - direction
	Star3 - direction
	Star4 - direction
	Star2 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image3)
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet5 image0)
	(have_image Star6 infrared1)
	(have_image Star7 infrared1)
))

)
