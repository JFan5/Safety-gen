; params: satgen 751976 2 1 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	thermograph0 - mode
	infrared1 - mode
	Star1 - direction
	Star2 - direction
	Star0 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument1 infrared1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(have_image Phenomenon4 infrared1)
	(have_image Star5 infrared1)
	(have_image Star6 thermograph0)
	(have_image Star7 image2)
))

)
