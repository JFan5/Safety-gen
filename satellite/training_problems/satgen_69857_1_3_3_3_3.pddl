; params: satgen 69857 1 3 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image0 - mode
	spectrograph1 - mode
	spectrograph2 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 spectrograph1)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Phenomenon3 image0)
	(have_image Phenomenon4 spectrograph2)
	(have_image Planet5 image0)
))

)
