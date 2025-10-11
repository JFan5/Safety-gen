; params: satgen 640892 1 2 4 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared0 - mode
	image1 - mode
	infrared3 - mode
	spectrograph2 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	Planet3 - direction
	Phenomenon4 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph2)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Planet3 infrared3)
	(have_image Phenomenon4 image1)
))

)
