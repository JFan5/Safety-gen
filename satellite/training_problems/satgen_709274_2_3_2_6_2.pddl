; params: satgen 709274 2 3 2 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	image0 - mode
	thermograph1 - mode
	Star2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation1 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 Star4)
	(supports instrument2 image0)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation1)
	(supports instrument3 image0)
	(supports instrument3 thermograph1)
	(calibration_target instrument3 GroundStation0)
	(calibration_target instrument3 GroundStation5)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(have_image Phenomenon6 image0)
	(have_image Planet7 image0)
))

)
