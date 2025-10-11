; params: satgen 974174 1 1 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	spectrograph0 - mode
	infrared1 - mode
	Star1 - direction
	Star2 - direction
	GroundStation0 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(pointing satellite0 Star6)
	(have_image Planet3 spectrograph2)
	(have_image Phenomenon4 infrared1)
	(have_image Star5 infrared1)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 spectrograph0)
	(have_image Phenomenon8 spectrograph2)
))

)
