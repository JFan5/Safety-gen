; params: satgen 570659 2 1 2 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Planet7 spectrograph0)
	(have_image Star8 spectrograph0)
	(have_image Star9 spectrograph0)
))

)
