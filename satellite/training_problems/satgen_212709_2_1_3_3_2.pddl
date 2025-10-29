; params: satgen 212709 2 1 3 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	spectrograph0 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Phenomenon3 - direction
	Planet4 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon3)
	(supports instrument1 image1)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Phenomenon3 image1)
	(have_image Planet4 spectrograph0)
))

)
