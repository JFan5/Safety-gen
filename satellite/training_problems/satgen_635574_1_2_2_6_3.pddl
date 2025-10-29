; params: satgen 635574 1 2 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star0 - direction
	Star4 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Planet6 thermograph0)
	(have_image Planet7 thermograph0)
	(have_image Planet8 spectrograph1)
))

)
