; params: satgen 567384 2 1 4 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	infrared1 - mode
	infrared3 - mode
	infrared2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation5 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(supports instrument0 infrared3)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 GroundStation7)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 infrared3)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation7)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite1 Phenomenon8)
	(have_image Phenomenon8 thermograph0)
	(have_image Star9 thermograph0)
	(have_image Planet10 infrared2)
	(have_image Planet11 infrared1)
))

)
