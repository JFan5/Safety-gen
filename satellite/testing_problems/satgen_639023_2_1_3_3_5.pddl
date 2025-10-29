; params: satgen 639023 2 1 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	thermograph2 - mode
	image0 - mode
	Star2 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 thermograph2)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Star6)
	(have_image Star3 image0)
	(have_image Phenomenon4 image0)
	(have_image Phenomenon5 image0)
	(have_image Star6 thermograph2)
	(have_image Star7 image1)
))

)
