; params: satgen 86459 2 1 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	infrared3 - mode
	infrared0 - mode
	infrared1 - mode
	Star1 - direction
	GroundStation3 - direction
	Star0 - direction
	GroundStation2 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph2)
	(supports instrument1 infrared0)
	(supports instrument1 infrared3)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(have_image Star4 spectrograph2)
	(have_image Star5 infrared1)
))

)
