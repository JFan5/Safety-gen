; params: satgen 99719 2 1 3 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 Planet3)
	(pointing satellite1 Phenomenon5)
	(have_image Planet3 spectrograph0)
	(have_image Planet4 thermograph1)
	(have_image Phenomenon5 thermograph1)
	(have_image Phenomenon6 spectrograph0)
))

)
