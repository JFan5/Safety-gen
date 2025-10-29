; params: satgen 924841 2 3 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	image1 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star5 - direction
	GroundStation4 - direction
	Star2 - direction
	Star1 - direction
	GroundStation3 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 infrared0)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation3)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 infrared0)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Planet6 infrared0)
	(have_image Phenomenon7 infrared0)
	(have_image Phenomenon8 infrared0)
	(have_image Planet9 infrared0)
	(have_image Planet10 image1)
))

)
