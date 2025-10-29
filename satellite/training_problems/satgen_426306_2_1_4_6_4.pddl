; params: satgen 426306 2 1 4 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	spectrograph2 - mode
	image0 - mode
	infrared3 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star4 - direction
	Star3 - direction
	GroundStation5 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 image0)
	(supports instrument1 spectrograph1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 Star3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Planet6 spectrograph2)
	(have_image Star7 spectrograph2)
	(have_image Planet8 spectrograph1)
	(have_image Star9 infrared3)
))

)
