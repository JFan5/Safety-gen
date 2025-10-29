; params: satgen 495542 1 1 2 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	image1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star0 - direction
	Star2 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Planet6 infrared0)
	(have_image Star7 infrared0)
	(have_image Planet8 infrared0)
	(have_image Phenomenon9 infrared0)
	(have_image Planet10 image1)
	(have_image Planet11 infrared0)
))

)
