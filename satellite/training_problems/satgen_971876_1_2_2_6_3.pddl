; params: satgen 971876 1 2 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation0 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Planet6 thermograph1)
	(have_image Planet7 spectrograph0)
	(have_image Planet8 thermograph1)
))

)
