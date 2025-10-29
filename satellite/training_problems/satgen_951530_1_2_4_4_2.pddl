; params: satgen 951530 1 2 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph1 - mode
	spectrograph2 - mode
	spectrograph0 - mode
	image3 - mode
	Star0 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Star1 - direction
	Planet4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph2)
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Planet4 spectrograph0)
	(have_image Star5 thermograph1)
))

)
