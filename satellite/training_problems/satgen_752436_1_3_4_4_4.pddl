; params: satgen 752436 1 3 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image3 - mode
	spectrograph2 - mode
	thermograph0 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Star3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 Star3)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph2)
	(supports instrument1 image3)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star0)
	(supports instrument2 image3)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Planet4 spectrograph2)
	(have_image Star5 infrared1)
	(have_image Planet6 image3)
	(have_image Planet7 image3)
))

)
