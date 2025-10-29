; params: satgen 794761 2 1 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	image1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation4 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation2)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet10)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Phenomenon6 spectrograph0)
	(have_image Planet7 spectrograph0)
	(have_image Phenomenon8 image1)
	(have_image Planet9 spectrograph0)
	(have_image Planet10 spectrograph0)
))

)
