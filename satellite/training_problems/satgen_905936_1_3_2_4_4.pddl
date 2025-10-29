; params: satgen 905936 1 3 2 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Phenomenon4 spectrograph0)
	(have_image Star5 spectrograph0)
	(have_image Phenomenon6 spectrograph1)
	(have_image Phenomenon7 spectrograph1)
))

)
