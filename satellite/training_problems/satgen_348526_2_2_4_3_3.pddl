; params: satgen 348526 2 2 4 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	image3 - mode
	spectrograph1 - mode
	spectrograph2 - mode
	Star2 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	Phenomenon3 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph2)
	(supports instrument1 image3)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon3)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(pointing satellite1 Phenomenon3)
	(have_image Phenomenon3 image3)
	(have_image Star4 infrared0)
	(have_image Star5 spectrograph2)
))

)
