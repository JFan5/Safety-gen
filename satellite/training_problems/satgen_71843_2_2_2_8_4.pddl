; params: satgen 71843 2 2 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	Star7 - direction
	Star5 - direction
	Star1 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet10)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon11)
)
(:goal (and
	(have_image Phenomenon8 spectrograph1)
	(have_image Phenomenon9 spectrograph1)
	(have_image Planet10 spectrograph1)
	(have_image Phenomenon11 spectrograph1)
))

)
