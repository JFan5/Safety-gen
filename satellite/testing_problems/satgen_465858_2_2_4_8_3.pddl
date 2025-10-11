; params: satgen 465858 2 2 4 8 3
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
	image3 - mode
	spectrograph1 - mode
	Star2 - direction
	Star4 - direction
	GroundStation7 - direction
	GroundStation5 - direction
	Star1 - direction
	GroundStation6 - direction
	Star3 - direction
	GroundStation0 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image3)
	(calibration_target instrument0 Star1)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 GroundStation6)
	(supports instrument2 image2)
	(calibration_target instrument2 GroundStation0)
	(calibration_target instrument2 Star3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(have_image Star8 image3)
	(have_image Star9 image3)
	(have_image Star10 spectrograph0)
))

)
