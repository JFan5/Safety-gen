; params: satgen 639435 1 2 2 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Phenomenon4 spectrograph0)
	(have_image Star5 spectrograph0)
	(have_image Phenomenon6 spectrograph0)
))

)
