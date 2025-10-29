; params: satgen 855413 2 2 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image2 - mode
	infrared3 - mode
	image1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star0 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star3)
	(supports instrument1 image2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument2 infrared3)
	(supports instrument2 image1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star0)
	(supports instrument3 image1)
	(calibration_target instrument3 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star9)
)
(:goal (and
	(have_image Planet4 image2)
	(have_image Star5 image2)
	(have_image Planet6 infrared3)
	(have_image Phenomenon7 image1)
	(have_image Star8 image1)
	(have_image Star9 spectrograph0)
))

)
