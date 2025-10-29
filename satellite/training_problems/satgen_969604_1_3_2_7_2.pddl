; params: satgen 969604 1 3 2 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image1 - mode
	thermograph0 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation4 - direction
	Star3 - direction
	GroundStation5 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star6)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star6)
	(calibration_target instrument1 Star3)
	(supports instrument2 image1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star6)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Planet7 thermograph0)
	(have_image Planet8 thermograph0)
))

)
