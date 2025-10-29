; params: satgen 258422 2 3 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	image2 - mode
	image3 - mode
	image1 - mode
	infrared0 - mode
	Star0 - direction
	GroundStation3 - direction
	GroundStation1 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star2 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 image2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation1)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 image3)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument2 image2)
	(calibration_target instrument2 Star2)
	(calibration_target instrument2 GroundStation4)
	(supports instrument3 image2)
	(supports instrument3 image1)
	(calibration_target instrument3 GroundStation5)
	(supports instrument4 infrared0)
	(calibration_target instrument4 Star2)
	(calibration_target instrument4 GroundStation5)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(pointing satellite0 Star7)
	(have_image Planet6 image3)
	(have_image Star7 image1)
	(have_image Planet8 image3)
	(have_image Star9 image2)
	(have_image Phenomenon10 infrared0)
	(have_image Star11 image3)
))

)
