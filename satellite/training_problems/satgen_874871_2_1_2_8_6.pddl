; params: satgen 874871 2 1 2 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	image0 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation7 - direction
	Star6 - direction
	Star5 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
	Planet11 - direction
	Star12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 GroundStation7)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 thermograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet11)
)
(:goal (and
	(pointing satellite1 GroundStation7)
	(have_image Planet8 thermograph1)
	(have_image Planet9 image0)
	(have_image Star10 thermograph1)
	(have_image Planet11 image0)
	(have_image Star12 thermograph1)
	(have_image Star13 image0)
))

)
