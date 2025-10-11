; params: satgen 495950 2 2 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	spectrograph2 - mode
	spectrograph3 - mode
	thermograph1 - mode
	GroundStation2 - direction
	GroundStation3 - direction
	Star0 - direction
	Star1 - direction
	Planet4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
	(supports instrument1 spectrograph3)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite0 Star5)
	(pointing satellite1 Star1)
	(have_image Planet4 thermograph1)
	(have_image Star5 spectrograph3)
))

)
