; params: satgen 205717 1 1 2 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image0 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Star4 image0)
	(have_image Phenomenon5 infrared1)
	(have_image Phenomenon6 image0)
	(have_image Phenomenon7 infrared1)
))

)
