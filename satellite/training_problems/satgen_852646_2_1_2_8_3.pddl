; params: satgen 852646 2 1 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	Star0 - direction
	GroundStation6 - direction
	GroundStation3 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet10)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite0 Planet8)
	(have_image Planet8 thermograph1)
	(have_image Star9 spectrograph0)
	(have_image Planet10 spectrograph0)
))

)
