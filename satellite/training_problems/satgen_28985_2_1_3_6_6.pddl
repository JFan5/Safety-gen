; params: satgen 28985 2 1 3 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph2 - mode
	thermograph1 - mode
	Star0 - direction
	Star1 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Star3 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Star6 thermograph1)
	(have_image Star7 spectrograph0)
	(have_image Planet8 spectrograph0)
	(have_image Star9 spectrograph0)
	(have_image Planet10 spectrograph0)
	(have_image Star11 thermograph1)
))

)
