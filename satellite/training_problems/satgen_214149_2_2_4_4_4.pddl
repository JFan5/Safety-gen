; params: satgen 214149 2 2 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	spectrograph1 - mode
	image3 - mode
	infrared0 - mode
	Star1 - direction
	Star2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 spectrograph2)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 spectrograph1)
	(supports instrument2 infrared0)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Star4 spectrograph1)
	(have_image Star5 image3)
	(have_image Star6 image3)
	(have_image Planet7 image3)
))

)
