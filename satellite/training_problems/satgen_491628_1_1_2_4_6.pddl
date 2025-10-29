; params: satgen 491628 1 1 2 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Star4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Star4 image0)
	(have_image Star5 infrared1)
	(have_image Phenomenon6 infrared1)
	(have_image Planet7 image0)
	(have_image Planet8 image0)
	(have_image Planet9 infrared1)
))

)
