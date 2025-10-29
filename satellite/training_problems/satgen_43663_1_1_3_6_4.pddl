; params: satgen 43663 1 1 3 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	image2 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
)
(:goal (and
	(have_image Phenomenon6 spectrograph1)
	(have_image Star7 thermograph0)
	(have_image Planet8 image2)
	(have_image Planet9 spectrograph1)
))

)
