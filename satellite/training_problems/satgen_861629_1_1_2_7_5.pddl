; params: satgen 861629 1 1 2 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
)
(:goal (and
	(have_image Star7 thermograph0)
	(have_image Planet8 spectrograph1)
	(have_image Planet9 spectrograph1)
	(have_image Star10 spectrograph1)
	(have_image Planet11 thermograph0)
))

)
