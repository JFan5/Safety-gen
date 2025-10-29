; params: satgen 516329 2 1 3 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	image1 - mode
	thermograph2 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation0 - direction
	Star4 - direction
	Star2 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(have_image Planet7 image1)
	(have_image Planet8 thermograph0)
	(have_image Phenomenon9 thermograph0)
))

)
