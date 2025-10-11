; params: satgen 476579 2 1 3 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	infrared1 - mode
	infrared0 - mode
	Star1 - direction
	Star3 - direction
	GroundStation2 - direction
	Star0 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite1 Planet7)
	(have_image Star4 infrared1)
	(have_image Star5 spectrograph2)
	(have_image Star6 infrared1)
	(have_image Planet7 infrared1)
	(have_image Phenomenon8 infrared1)
))

)
