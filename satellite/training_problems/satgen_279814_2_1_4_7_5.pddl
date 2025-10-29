; params: satgen 279814 2 1 4 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	spectrograph3 - mode
	infrared2 - mode
	spectrograph0 - mode
	GroundStation1 - direction
	Star5 - direction
	Star6 - direction
	Star3 - direction
	Star0 - direction
	Star4 - direction
	Star2 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Planet7 infrared2)
	(have_image Star8 infrared2)
	(have_image Star9 spectrograph0)
	(have_image Phenomenon10 image1)
	(have_image Star11 spectrograph3)
))

)
