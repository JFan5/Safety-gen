; params: satgen 419168 1 3 2 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	Star6 - direction
	Star4 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star4)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
)
(:goal (and
	(have_image Star7 thermograph0)
	(have_image Planet8 thermograph0)
	(have_image Star9 spectrograph1)
	(have_image Planet10 spectrograph1)
	(have_image Star11 spectrograph1)
	(have_image Planet12 thermograph0)
))

)
