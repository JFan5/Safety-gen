; params: satgen 11192 1 1 3 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image0 - mode
	infrared2 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Star4 infrared2)
	(have_image Star5 infrared1)
	(have_image Star6 infrared1)
	(have_image Phenomenon7 infrared2)
	(have_image Star8 infrared1)
))

)
