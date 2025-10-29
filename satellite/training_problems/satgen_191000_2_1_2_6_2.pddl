; params: satgen 191000 2 1 2 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	infrared0 - mode
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation0 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 thermograph1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Phenomenon6 thermograph1)
	(have_image Phenomenon7 infrared0)
))

)
