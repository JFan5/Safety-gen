; params: satgen 779910 2 3 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	image1 - mode
	image0 - mode
	spectrograph2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Phenomenon4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 Star0)
	(supports instrument1 spectrograph2)
	(supports instrument1 image1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 image0)
	(supports instrument2 image1)
	(calibration_target instrument2 Star1)
	(supports instrument3 spectrograph2)
	(supports instrument3 image1)
	(supports instrument3 image0)
	(calibration_target instrument3 Star1)
	(supports instrument4 image1)
	(supports instrument4 image0)
	(calibration_target instrument4 Star2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Star3)
	(have_image Star3 image1)
	(have_image Phenomenon4 image1)
	(have_image Star5 image0)
))

)
