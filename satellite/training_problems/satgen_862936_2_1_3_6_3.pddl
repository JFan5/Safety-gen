; params: satgen 862936 2 1 3 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	image1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star4 - direction
	Star5 - direction
	Star3 - direction
	Star2 - direction
	GroundStation0 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image2)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument1 spectrograph0)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite1 GroundStation1)
	(have_image Star6 spectrograph0)
	(have_image Planet7 image1)
	(have_image Planet8 spectrograph0)
))

)
