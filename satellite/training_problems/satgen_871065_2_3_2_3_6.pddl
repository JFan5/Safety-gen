; params: satgen 871065 2 3 2 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph0 - mode
	image1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Star3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite0 Phenomenon4)
	(have_image Star3 image1)
	(have_image Phenomenon4 image1)
	(have_image Planet5 image1)
	(have_image Star6 image1)
	(have_image Planet7 spectrograph0)
	(have_image Star8 image1)
))

)
