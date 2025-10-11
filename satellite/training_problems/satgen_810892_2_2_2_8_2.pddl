; params: satgen 810892 2 2 2 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph0 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation4 - direction
	Star6 - direction
	Star7 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph0)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation3)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument2 image1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(pointing satellite0 Planet9)
	(pointing satellite1 GroundStation3)
	(have_image Star8 image1)
	(have_image Planet9 spectrograph0)
))

)
