; params: satgen 709013 1 1 2 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Star6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(have_image Star6 infrared1)
	(have_image Phenomenon7 infrared1)
	(have_image Phenomenon8 image0)
	(have_image Planet9 image0)
	(have_image Planet10 infrared1)
	(have_image Planet11 infrared1)
))

)
