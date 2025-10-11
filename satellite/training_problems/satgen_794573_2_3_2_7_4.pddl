; params: satgen 794573 2 3 2 7 4
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
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	Star1 - direction
	Star2 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation6)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star1)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 thermograph1)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 Star2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Star7 thermograph1)
	(have_image Planet8 thermograph0)
	(have_image Star9 thermograph1)
	(have_image Phenomenon10 thermograph0)
))

)
