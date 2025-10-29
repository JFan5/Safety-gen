; params: satgen 721572 2 2 3 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared0 - mode
	image1 - mode
	spectrograph2 - mode
	Star1 - direction
	Star5 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph2)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation4)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet9)
	(supports instrument2 spectrograph2)
	(supports instrument2 infrared0)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(have_image Phenomenon6 spectrograph2)
	(have_image Star7 infrared0)
	(have_image Phenomenon8 infrared0)
	(have_image Planet9 infrared0)
	(have_image Planet10 image1)
))

)
