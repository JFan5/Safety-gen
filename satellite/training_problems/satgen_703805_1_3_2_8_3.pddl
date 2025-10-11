; params: satgen 703805 1 3 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared1 - mode
	image0 - mode
	GroundStation0 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	Star6 - direction
	GroundStation1 - direction
	Star2 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star6)
	(supports instrument1 image0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
)
(:goal (and
	(have_image Planet8 image0)
	(have_image Star9 image0)
	(have_image Planet10 image0)
))

)
