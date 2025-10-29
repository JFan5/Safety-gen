; params: satgen 736524 1 1 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	infrared1 - mode
	spectrograph0 - mode
	thermograph3 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation1 - direction
	Star4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Star4 thermograph3)
	(have_image Phenomenon5 spectrograph0)
	(have_image Planet6 infrared1)
	(have_image Star7 image2)
	(have_image Star8 infrared1)
	(have_image Planet9 image2)
))

)
