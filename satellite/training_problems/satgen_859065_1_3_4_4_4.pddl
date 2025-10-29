; params: satgen 859065 1 3 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image1 - mode
	spectrograph2 - mode
	infrared3 - mode
	thermograph0 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star0 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 Star3)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star0)
	(supports instrument2 infrared3)
	(supports instrument2 thermograph0)
	(supports instrument2 image1)
	(calibration_target instrument2 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Planet4 thermograph0)
	(have_image Star5 thermograph0)
	(have_image Planet6 thermograph0)
	(have_image Star7 image1)
))

)
