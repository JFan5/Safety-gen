; params: satgen 434087 2 1 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph2 - mode
	image1 - mode
	image3 - mode
	image0 - mode
	Star0 - direction
	Star1 - direction
	Star4 - direction
	GroundStation3 - direction
	Star2 - direction
	Planet5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument1 image0)
	(supports instrument1 spectrograph2)
	(supports instrument1 image3)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite1 Star4)
	(have_image Planet5 image1)
	(have_image Planet6 spectrograph2)
))

)
