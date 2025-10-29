; params: satgen 916968 2 2 3 6 5
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
	spectrograph0 - mode
	infrared1 - mode
	Star1 - direction
	GroundStation5 - direction
	Star0 - direction
	Star4 - direction
	Star3 - direction
	GroundStation2 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star0)
	(supports instrument1 spectrograph0)
	(supports instrument1 image2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument2 image2)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star3)
	(calibration_target instrument2 Star4)
	(supports instrument3 image2)
	(supports instrument3 infrared1)
	(calibration_target instrument3 GroundStation2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon6)
)
(:goal (and
	(pointing satellite0 Star7)
	(pointing satellite1 Phenomenon6)
	(have_image Phenomenon6 infrared1)
	(have_image Star7 infrared1)
	(have_image Phenomenon8 infrared1)
	(have_image Star9 infrared1)
	(have_image Star10 infrared1)
))

)
