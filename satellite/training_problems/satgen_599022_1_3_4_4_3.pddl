; params: satgen 599022 1 3 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image3 - mode
	spectrograph2 - mode
	image0 - mode
	image1 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 Star3)
	(supports instrument1 image0)
	(supports instrument1 image1)
	(supports instrument1 spectrograph2)
	(supports instrument1 image3)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Phenomenon4 image1)
	(have_image Phenomenon5 image0)
	(have_image Planet6 image3)
))

)
