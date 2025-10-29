; params: satgen 51966 1 1 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star4 - direction
	GroundStation5 - direction
	Star3 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Planet6 spectrograph0)
	(have_image Planet7 spectrograph0)
	(have_image Phenomenon8 spectrograph0)
))

)
