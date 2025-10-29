; params: satgen 310930 1 1 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared3 - mode
	image0 - mode
	image2 - mode
	infrared1 - mode
	Star1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation0 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet4 infrared3)
	(have_image Star5 infrared3)
	(have_image Phenomenon6 image2)
	(have_image Star7 infrared1)
))

)
