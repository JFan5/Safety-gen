; params: satgen 789621 2 1 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star4 - direction
	Star6 - direction
	GroundStation7 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star5 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet9)
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite1 Star5)
	(have_image Phenomenon8 infrared1)
	(have_image Planet9 infrared0)
	(have_image Star10 infrared0)
))

)
