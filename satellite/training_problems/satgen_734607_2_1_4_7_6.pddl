; params: satgen 734607 2 1 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph3 - mode
	image1 - mode
	spectrograph0 - mode
	image2 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star6 - direction
	Star4 - direction
	GroundStation5 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 image2)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 image2)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite1 Star6)
	(have_image Phenomenon7 image2)
	(have_image Phenomenon8 image2)
	(have_image Planet9 spectrograph3)
	(have_image Phenomenon10 image1)
	(have_image Star11 image2)
	(have_image Planet12 spectrograph0)
))

)
