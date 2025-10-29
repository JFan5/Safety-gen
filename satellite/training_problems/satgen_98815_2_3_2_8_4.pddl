; params: satgen 98815 2 3 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star7 - direction
	GroundStation0 - direction
	Star2 - direction
	GroundStation6 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation6)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(have_image Phenomenon8 infrared1)
	(have_image Star9 infrared1)
	(have_image Planet10 infrared1)
	(have_image Phenomenon11 infrared1)
))

)
