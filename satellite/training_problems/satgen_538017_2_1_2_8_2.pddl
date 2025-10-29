; params: satgen 538017 2 1 2 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	image0 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation7 - direction
	GroundStation6 - direction
	GroundStation3 - direction
	GroundStation1 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation6)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite0 Star2)
	(pointing satellite1 GroundStation0)
	(have_image Star8 image0)
	(have_image Planet9 infrared1)
))

)
