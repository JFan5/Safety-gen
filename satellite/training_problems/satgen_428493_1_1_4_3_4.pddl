; params: satgen 428493 1 1 4 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	infrared1 - mode
	infrared0 - mode
	spectrograph3 - mode
	Star1 - direction
	GroundStation2 - direction
	Star0 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Phenomenon3 infrared0)
	(have_image Phenomenon4 infrared1)
	(have_image Planet5 infrared0)
	(have_image Star6 image2)
))

)
