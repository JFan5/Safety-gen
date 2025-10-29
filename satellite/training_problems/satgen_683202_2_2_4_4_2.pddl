; params: satgen 683202 2 2 4 4 2
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
	infrared1 - mode
	spectrograph0 - mode
	spectrograph3 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation1 - direction
	Planet4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star3)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
	(supports instrument2 infrared2)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation1)
	(supports instrument3 infrared2)
	(supports instrument3 infrared1)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite1 Phenomenon5)
	(have_image Planet4 infrared2)
	(have_image Phenomenon5 infrared1)
))

)
