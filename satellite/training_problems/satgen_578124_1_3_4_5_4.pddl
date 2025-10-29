; params: satgen 578124 1 3 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared2 - mode
	spectrograph3 - mode
	image0 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	Star3 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image0)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Planet5 infrared2)
	(have_image Star6 spectrograph3)
	(have_image Star7 spectrograph3)
	(have_image Star8 image0)
))

)
