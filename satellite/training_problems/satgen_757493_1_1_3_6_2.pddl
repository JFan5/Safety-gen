; params: satgen 757493 1 1 3 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared0 - mode
	image1 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation2 - direction
	Star0 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Star6 infrared0)
	(have_image Planet7 spectrograph2)
))

)
