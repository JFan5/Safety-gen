; params: satgen 841155 1 3 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	image0 - mode
	thermograph2 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star0 - direction
	GroundStation5 - direction
	Phenomenon8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Phenomenon8 thermograph2)
	(have_image Star9 infrared1)
	(have_image Phenomenon10 infrared1)
	(have_image Phenomenon11 thermograph2)
))

)
