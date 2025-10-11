; params: satgen 200394 2 1 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	infrared0 - mode
	infrared3 - mode
	image2 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	Star4 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
	Planet10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument1 infrared0)
	(supports instrument1 infrared3)
	(supports instrument1 image2)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(pointing satellite0 Phenomenon11)
	(pointing satellite1 Star7)
	(have_image Star6 image2)
	(have_image Star7 infrared3)
	(have_image Star8 infrared0)
	(have_image Planet9 image2)
	(have_image Planet10 image1)
	(have_image Phenomenon11 image1)
))

)
