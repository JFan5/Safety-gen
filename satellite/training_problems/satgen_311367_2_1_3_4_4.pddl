; params: satgen 311367 2 1 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	infrared0 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation3 - direction
	Star1 - direction
	Star2 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 infrared2)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(have_image Planet4 infrared2)
	(have_image Star5 spectrograph1)
	(have_image Planet6 infrared2)
	(have_image Phenomenon7 spectrograph1)
))

)
