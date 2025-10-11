; params: satgen 334121 2 2 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	infrared0 - mode
	spectrograph1 - mode
	image3 - mode
	GroundStation1 - direction
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 infrared0)
	(supports instrument1 image3)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 Star0)
	(have_image Star3 image3)
	(have_image Phenomenon4 spectrograph1)
	(have_image Star5 image3)
	(have_image Star6 spectrograph2)
	(have_image Planet7 infrared0)
))

)
