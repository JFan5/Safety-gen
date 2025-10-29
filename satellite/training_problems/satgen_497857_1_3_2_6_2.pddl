; params: satgen 497857 1 3 2 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image0 - mode
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	GroundStation4 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation4)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
)
(:goal (and
	(have_image Star6 infrared1)
	(have_image Star7 image0)
))

)
