; params: satgen 283040 2 2 3 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	thermograph0 - mode
	image2 - mode
	GroundStation0 - direction
	Star2 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star3 - direction
	GroundStation1 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star11)
	(supports instrument1 image2)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 Star3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon10)
)
(:goal (and
	(pointing satellite0 Star6)
	(pointing satellite1 Star8)
	(have_image Phenomenon7 image2)
	(have_image Star8 thermograph0)
	(have_image Star9 thermograph0)
	(have_image Phenomenon10 image1)
	(have_image Star11 thermograph0)
))

)
