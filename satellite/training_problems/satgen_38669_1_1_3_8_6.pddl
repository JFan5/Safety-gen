; params: satgen 38669 1 1 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	spectrograph1 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star1 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Phenomenon12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star10)
)
(:goal (and
	(pointing satellite0 Planet13)
	(have_image Planet8 spectrograph1)
	(have_image Phenomenon9 infrared0)
	(have_image Star10 spectrograph1)
	(have_image Phenomenon11 spectrograph1)
	(have_image Phenomenon12 spectrograph2)
	(have_image Planet13 spectrograph1)
))

)
