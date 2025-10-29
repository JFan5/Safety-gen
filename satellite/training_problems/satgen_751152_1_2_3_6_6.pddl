; params: satgen 751152 1 2 3 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	spectrograph1 - mode
	infrared0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation0 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon10)
)
(:goal (and
	(have_image Phenomenon6 spectrograph1)
	(have_image Planet7 infrared0)
	(have_image Phenomenon8 spectrograph2)
	(have_image Planet9 infrared0)
	(have_image Phenomenon10 spectrograph1)
	(have_image Planet11 spectrograph2)
))

)
