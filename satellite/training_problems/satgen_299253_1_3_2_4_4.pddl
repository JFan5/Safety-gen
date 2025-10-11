; params: satgen 299253 1 3 2 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	Star2 - direction
	GroundStation0 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Planet4 spectrograph0)
	(have_image Star5 spectrograph1)
	(have_image Phenomenon6 spectrograph0)
	(have_image Phenomenon7 spectrograph0)
))

)
