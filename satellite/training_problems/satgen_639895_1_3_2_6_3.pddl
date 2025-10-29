; params: satgen 639895 1 3 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation1 - direction
	Star0 - direction
	GroundStation5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Planet6 thermograph0)
	(have_image Star7 spectrograph1)
	(have_image Star8 thermograph0)
))

)
