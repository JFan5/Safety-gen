; params: satgen 270973 1 1 2 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	image1 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	Star5 - direction
	GroundStation3 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Star6 spectrograph0)
	(have_image Star7 image1)
	(have_image Star8 spectrograph0)
	(have_image Planet9 spectrograph0)
))

)
