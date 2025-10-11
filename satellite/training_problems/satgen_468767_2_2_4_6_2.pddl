; params: satgen 468767 2 2 4 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph0 - mode
	image2 - mode
	infrared1 - mode
	spectrograph3 - mode
	Star1 - direction
	Star2 - direction
	Star4 - direction
	Star3 - direction
	GroundStation0 - direction
	GroundStation5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 image2)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star6 infrared1)
	(have_image Planet7 spectrograph3)
))

)
