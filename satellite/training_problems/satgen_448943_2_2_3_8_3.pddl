; params: satgen 448943 2 2 3 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	spectrograph0 - mode
	image1 - mode
	GroundStation0 - direction
	Star2 - direction
	Star5 - direction
	GroundStation6 - direction
	Star1 - direction
	GroundStation4 - direction
	Star3 - direction
	GroundStation7 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation7)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation4)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 GroundStation7)
	(calibration_target instrument2 Star3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(have_image Star8 image1)
	(have_image Planet9 spectrograph0)
	(have_image Star10 spectrograph0)
))

)
