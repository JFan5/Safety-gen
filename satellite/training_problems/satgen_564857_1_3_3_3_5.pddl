; params: satgen 564857 1 3 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	image0 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
)
(:goal (and
	(have_image Phenomenon3 image2)
	(have_image Star4 infrared1)
	(have_image Planet5 image2)
	(have_image Star6 image2)
	(have_image Planet7 infrared1)
))

)
