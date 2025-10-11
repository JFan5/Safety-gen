; params: satgen 366648 2 1 4 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	thermograph3 - mode
	infrared0 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star4 - direction
	GroundStation3 - direction
	Star5 - direction
	Star2 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 image1)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(have_image Phenomenon6 infrared2)
	(have_image Planet7 infrared0)
	(have_image Planet8 image1)
	(have_image Star9 thermograph3)
))

)
