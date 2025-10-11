; params: satgen 843659 2 1 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	infrared3 - mode
	image0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	Star3 - direction
	Star2 - direction
	GroundStation1 - direction
	Phenomenon4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument1 infrared2)
	(supports instrument1 infrared3)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Phenomenon4 spectrograph1)
	(have_image Star5 infrared3)
	(have_image Planet6 infrared3)
	(have_image Planet7 spectrograph1)
))

)
