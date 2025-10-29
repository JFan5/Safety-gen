; params: satgen 603803 1 1 2 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star0 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Phenomenon6 thermograph1)
	(have_image Star7 spectrograph0)
	(have_image Star8 spectrograph0)
	(have_image Planet9 thermograph1)
))

)
