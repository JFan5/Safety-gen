; params: satgen 796489 1 3 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	image0 - mode
	GroundStation0 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Star5 image0)
	(have_image Phenomenon6 spectrograph1)
	(have_image Star7 spectrograph1)
))

)
