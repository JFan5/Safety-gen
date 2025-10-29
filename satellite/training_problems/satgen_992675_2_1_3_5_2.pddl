; params: satgen 992675 2 1 3 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	infrared2 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation1 - direction
	Phenomenon5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 spectrograph0)
	(supports instrument1 image1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Phenomenon5 image1)
	(have_image Star6 infrared2)
))

)
