; params: satgen 573747 2 2 3 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph2 - mode
	thermograph0 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation6 - direction
	Star7 - direction
	GroundStation5 - direction
	Star2 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite0 GroundStation5)
	(pointing satellite1 GroundStation3)
	(have_image Planet8 thermograph0)
	(have_image Planet9 thermograph0)
))

)
