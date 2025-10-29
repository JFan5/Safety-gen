; params: satgen 678877 1 1 2 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	spectrograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star0 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Phenomenon3 infrared0)
	(have_image Phenomenon4 infrared0)
))

)
