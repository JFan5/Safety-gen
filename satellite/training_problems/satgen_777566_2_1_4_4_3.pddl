; params: satgen 777566 2 1 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	image0 - mode
	spectrograph3 - mode
	infrared1 - mode
	GroundStation2 - direction
	Star3 - direction
	Star0 - direction
	GroundStation1 - direction
	Phenomenon4 - direction
	Star5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph3)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite1 GroundStation1)
	(have_image Phenomenon4 infrared1)
	(have_image Star5 infrared1)
	(have_image Star6 spectrograph2)
))

)
