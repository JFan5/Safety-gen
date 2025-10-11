; params: satgen 315509 2 2 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared2 - mode
	spectrograph1 - mode
	thermograph3 - mode
	spectrograph0 - mode
	GroundStation3 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 spectrograph0)
	(supports instrument2 infrared2)
	(calibration_target instrument2 Star0)
	(supports instrument3 thermograph3)
	(supports instrument3 spectrograph1)
	(calibration_target instrument3 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet5)
)
(:goal (and
	(pointing satellite0 Planet5)
	(pointing satellite1 Star0)
	(have_image Star4 thermograph3)
	(have_image Planet5 infrared2)
	(have_image Star6 spectrograph1)
))

)
