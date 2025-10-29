; params: satgen 291097 2 1 4 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	image3 - mode
	infrared0 - mode
	image2 - mode
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star0 - direction
	GroundStation1 - direction
	GroundStation6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 infrared1)
	(supports instrument1 image2)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation6)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Star7 infrared0)
	(have_image Phenomenon8 infrared0)
	(have_image Phenomenon9 image2)
))

)
