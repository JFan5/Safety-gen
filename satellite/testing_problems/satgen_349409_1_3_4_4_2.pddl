; params: satgen 349409 1 3 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image2 - mode
	spectrograph0 - mode
	image1 - mode
	infrared3 - mode
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star0 - direction
	Star4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star3)
	(supports instrument1 image2)
	(supports instrument1 image1)
	(supports instrument1 infrared3)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Star4 infrared3)
	(have_image Star5 image1)
))

)
