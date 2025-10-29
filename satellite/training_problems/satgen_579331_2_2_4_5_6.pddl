; params: satgen 579331 2 2 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph3 - mode
	spectrograph1 - mode
	thermograph0 - mode
	image2 - mode
	GroundStation1 - direction
	GroundStation4 - direction
	Star0 - direction
	Star3 - direction
	Star2 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph3)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 spectrograph3)
	(supports instrument1 image2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument2 spectrograph1)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 Star3)
	(supports instrument3 thermograph0)
	(supports instrument3 spectrograph3)
	(supports instrument3 image2)
	(calibration_target instrument3 Star2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(have_image Star5 spectrograph1)
	(have_image Planet6 spectrograph3)
	(have_image Planet7 spectrograph3)
	(have_image Star8 spectrograph3)
	(have_image Planet9 spectrograph1)
	(have_image Star10 image2)
))

)
