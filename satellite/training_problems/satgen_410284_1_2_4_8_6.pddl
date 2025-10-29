; params: satgen 410284 1 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	spectrograph3 - mode
	spectrograph2 - mode
	thermograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star6 - direction
	Star7 - direction
	GroundStation5 - direction
	Planet8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Planet11 - direction
	Planet12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon10)
)
(:goal (and
	(have_image Planet8 thermograph0)
	(have_image Planet9 thermograph0)
	(have_image Phenomenon10 thermograph0)
	(have_image Planet11 spectrograph2)
	(have_image Planet12 spectrograph3)
	(have_image Planet13 thermograph0)
))

)
