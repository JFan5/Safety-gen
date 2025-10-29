; params: satgen 53355 2 3 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	thermograph0 - mode
	infrared1 - mode
	GroundStation1 - direction
	Star2 - direction
	Star5 - direction
	GroundStation4 - direction
	Star6 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star6)
	(supports instrument1 infrared1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star6)
	(supports instrument3 infrared1)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 GroundStation0)
	(supports instrument4 thermograph0)
	(calibration_target instrument4 GroundStation3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(pointing satellite1 Planet8)
	(have_image Phenomenon7 thermograph0)
	(have_image Planet8 infrared1)
	(have_image Star9 infrared1)
	(have_image Phenomenon10 thermograph0)
))

)
