; params: satgen 315042 2 1 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph3 - mode
	thermograph2 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph3)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
	(supports instrument1 thermograph2)
	(supports instrument1 thermograph3)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(pointing satellite1 Planet7)
	(have_image Phenomenon3 thermograph3)
	(have_image Phenomenon4 spectrograph1)
	(have_image Star5 thermograph3)
	(have_image Phenomenon6 thermograph3)
	(have_image Planet7 spectrograph1)
	(have_image Planet8 thermograph3)
))

)
