; params: satgen 10701 2 2 3 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared2 - mode
	image1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	Star4 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star2 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 infrared2)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument2 image1)
	(calibration_target instrument2 Star2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(have_image Star6 infrared2)
	(have_image Star7 infrared2)
	(have_image Star8 spectrograph0)
	(have_image Planet9 spectrograph0)
	(have_image Planet10 infrared2)
))

)
