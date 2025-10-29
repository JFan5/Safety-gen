; params: satgen 204330 1 3 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	infrared0 - mode
	spectrograph3 - mode
	infrared2 - mode
	Star0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star2 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
)
(:goal (and
	(pointing satellite0 Phenomenon4)
	(have_image Phenomenon4 spectrograph1)
	(have_image Phenomenon5 infrared0)
))

)
