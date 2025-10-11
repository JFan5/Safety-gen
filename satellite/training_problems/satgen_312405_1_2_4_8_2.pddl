; params: satgen 312405 1 2 4 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image1 - mode
	infrared0 - mode
	infrared2 - mode
	image3 - mode
	Star1 - direction
	Star3 - direction
	Star5 - direction
	GroundStation6 - direction
	Star7 - direction
	GroundStation2 - direction
	Star4 - direction
	GroundStation0 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 image1)
	(supports instrument1 infrared0)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Phenomenon8 infrared2)
	(have_image Planet9 image3)
))

)
