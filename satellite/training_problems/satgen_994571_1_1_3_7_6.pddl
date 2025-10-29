; params: satgen 994571 1 1 3 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image2 - mode
	infrared0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star5 - direction
	Star6 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star0)
	(have_image Star7 infrared1)
	(have_image Phenomenon8 infrared1)
	(have_image Star9 infrared1)
	(have_image Planet10 infrared1)
	(have_image Star11 infrared1)
	(have_image Phenomenon12 infrared0)
))

)
