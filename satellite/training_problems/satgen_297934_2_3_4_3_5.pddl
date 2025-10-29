; params: satgen 297934 2 3 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph3 - mode
	thermograph1 - mode
	spectrograph2 - mode
	thermograph0 - mode
	Star2 - direction
	Star0 - direction
	Star1 - direction
	Star3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star0)
	(supports instrument2 spectrograph2)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 Star1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(have_image Star3 thermograph0)
	(have_image Planet4 thermograph1)
	(have_image Star5 spectrograph3)
	(have_image Planet6 thermograph1)
	(have_image Planet7 spectrograph2)
))

)
