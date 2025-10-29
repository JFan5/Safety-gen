; params: satgen 162813 1 1 2 6 6
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
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Phenomenon6 thermograph0)
	(have_image Phenomenon7 thermograph0)
	(have_image Planet8 spectrograph1)
	(have_image Planet9 thermograph0)
	(have_image Phenomenon10 thermograph0)
	(have_image Planet11 spectrograph1)
))

)
