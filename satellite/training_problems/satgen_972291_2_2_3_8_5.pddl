; params: satgen 972291 2 2 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph2 - mode
	image0 - mode
	thermograph1 - mode
	Star2 - direction
	Star5 - direction
	GroundStation7 - direction
	GroundStation0 - direction
	Star6 - direction
	Star3 - direction
	Star4 - direction
	GroundStation1 - direction
	Star8 - direction
	Planet9 - direction
	Planet10 - direction
	Planet11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star4)
	(calibration_target instrument2 Star3)
	(supports instrument3 image0)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(pointing satellite1 GroundStation1)
	(have_image Star8 thermograph1)
	(have_image Planet9 image0)
	(have_image Planet10 thermograph1)
	(have_image Planet11 thermograph2)
	(have_image Star12 thermograph2)
))

)
