; params: satgen 944760 2 2 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star1 - direction
	Star5 - direction
	Star3 - direction
	GroundStation6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
	(supports instrument2 thermograph0)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation6)
	(calibration_target instrument2 Star3)
	(supports instrument3 thermograph0)
	(supports instrument3 thermograph1)
	(calibration_target instrument3 GroundStation6)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(have_image Planet7 thermograph1)
	(have_image Phenomenon8 thermograph0)
	(have_image Star9 thermograph1)
	(have_image Planet10 thermograph1)
))

)
