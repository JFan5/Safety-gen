; params: satgen 804156 1 2 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	infrared0 - mode
	spectrograph2 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Star4 image1)
	(have_image Phenomenon5 infrared0)
	(have_image Phenomenon6 infrared0)
	(have_image Planet7 spectrograph2)
))

)
