; params: satgen 253427 2 2 4 3 4
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
	spectrograph3 - mode
	infrared1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument2 spectrograph3)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation2)
	(supports instrument3 infrared2)
	(supports instrument3 spectrograph0)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(have_image Planet3 infrared1)
	(have_image Phenomenon4 spectrograph3)
	(have_image Phenomenon5 infrared2)
	(have_image Star6 infrared2)
))

)
