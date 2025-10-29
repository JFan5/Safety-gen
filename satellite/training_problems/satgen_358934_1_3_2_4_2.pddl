; params: satgen 358934 1 3 2 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	spectrograph0 - mode
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star0 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Phenomenon4 image1)
	(have_image Phenomenon5 spectrograph0)
))

)
