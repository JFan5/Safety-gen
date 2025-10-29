; params: satgen 451774 2 2 3 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph2 - mode
	infrared0 - mode
	thermograph1 - mode
	GroundStation0 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star2 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation7)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation6)
)
(:goal (and
	(pointing satellite0 GroundStation6)
	(have_image Phenomenon8 thermograph1)
	(have_image Star9 infrared0)
	(have_image Star10 thermograph2)
))

)
