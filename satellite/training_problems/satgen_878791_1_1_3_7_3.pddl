; params: satgen 878791 1 1 3 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	infrared1 - mode
	image2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation3 - direction
	Planet7 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(have_image Planet7 infrared1)
	(have_image Planet8 infrared1)
	(have_image Planet9 image2)
))

)
