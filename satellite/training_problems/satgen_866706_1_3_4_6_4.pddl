; params: satgen 866706 1 3 4 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	thermograph2 - mode
	thermograph0 - mode
	spectrograph3 - mode
	Star0 - direction
	Star5 - direction
	Star2 - direction
	Star3 - direction
	Star1 - direction
	Star4 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 Star1)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Star6 thermograph2)
	(have_image Planet7 thermograph2)
	(have_image Star8 spectrograph1)
	(have_image Star9 thermograph2)
))

)
