; params: satgen 458130 1 1 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared3 - mode
	image1 - mode
	image0 - mode
	infrared2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation4 - direction
	Star7 - direction
	Star8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Planet11 - direction
	Phenomenon12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star7)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star8 image0)
	(have_image Star9 infrared2)
	(have_image Phenomenon10 image1)
	(have_image Planet11 infrared3)
	(have_image Phenomenon12 infrared3)
	(have_image Star13 infrared2)
))

)
