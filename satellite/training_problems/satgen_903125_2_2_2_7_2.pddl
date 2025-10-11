; params: satgen 903125 2 2 2 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image1 - mode
	spectrograph0 - mode
	Star1 - direction
	Star2 - direction
	Star4 - direction
	Star6 - direction
	GroundStation5 - direction
	Star0 - direction
	Star3 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 Star3)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument2 image1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star3)
	(supports instrument3 image1)
	(calibration_target instrument3 Star3)
	(calibration_target instrument3 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(have_image Planet7 spectrograph0)
	(have_image Planet8 image1)
))

)
