; params: satgen 853560 1 2 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image1 - mode
	infrared2 - mode
	infrared0 - mode
	image3 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation5 - direction
	Star6 - direction
	Star7 - direction
	GroundStation1 - direction
	Star4 - direction
	Planet8 - direction
	Planet9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image1)
	(supports instrument1 infrared2)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Planet8)
	(have_image Planet8 infrared0)
	(have_image Planet9 image1)
	(have_image Planet10 infrared0)
))

)
