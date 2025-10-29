; params: satgen 668953 1 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph2 - mode
	spectrograph0 - mode
	thermograph3 - mode
	spectrograph1 - mode
	Star1 - direction
	Star5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star2 - direction
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Planet11 - direction
	Planet12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph3)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star4)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet12)
)
(:goal (and
	(pointing satellite0 Planet12)
	(have_image Phenomenon8 spectrograph2)
	(have_image Star9 thermograph3)
	(have_image Planet10 thermograph3)
	(have_image Planet11 spectrograph2)
	(have_image Planet12 spectrograph2)
	(have_image Planet13 spectrograph1)
))

)
