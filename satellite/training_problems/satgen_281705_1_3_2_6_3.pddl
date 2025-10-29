; params: satgen 281705 1 3 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph1 - mode
	image0 - mode
	Star0 - direction
	Star4 - direction
	Star2 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 Star2)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation1)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Phenomenon6 thermograph1)
	(have_image Phenomenon7 image0)
	(have_image Star8 thermograph1)
))

)
