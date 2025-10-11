; params: satgen 234394 1 1 4 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	image3 - mode
	image2 - mode
	Star1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star0 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 spectrograph0)
	(supports instrument0 image2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(have_image Planet6 thermograph1)
	(have_image Star7 thermograph1)
))

)
