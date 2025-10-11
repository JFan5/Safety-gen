; params: satgen 913528 1 1 4 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared3 - mode
	infrared1 - mode
	image0 - mode
	thermograph2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	Star4 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 thermograph2)
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Phenomenon8 infrared1)
	(have_image Star9 infrared3)
	(have_image Planet10 infrared3)
	(have_image Star11 infrared1)
))

)
