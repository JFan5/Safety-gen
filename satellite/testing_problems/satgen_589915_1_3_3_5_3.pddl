; params: satgen 589915 1 3 3 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared2 - mode
	spectrograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	GroundStation4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star2)
	(supports instrument1 infrared2)
	(supports instrument1 spectrograph1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Planet5 spectrograph1)
	(have_image Phenomenon6 spectrograph0)
	(have_image Planet7 infrared2)
))

)
