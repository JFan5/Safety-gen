; params: satgen 157952 1 1 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image0 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star1 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(have_image Star8 infrared1)
	(have_image Phenomenon9 infrared1)
	(have_image Phenomenon10 image0)
))

)
