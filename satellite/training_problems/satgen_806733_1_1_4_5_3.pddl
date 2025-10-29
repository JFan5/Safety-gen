; params: satgen 806733 1 1 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	infrared2 - mode
	spectrograph0 - mode
	image3 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 image3)
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Planet5 spectrograph0)
	(have_image Planet6 image1)
	(have_image Planet7 image1)
))

)
