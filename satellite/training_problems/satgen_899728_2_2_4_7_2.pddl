; params: satgen 899728 2 2 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	infrared0 - mode
	infrared3 - mode
	thermograph1 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	Star2 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 infrared3)
	(supports instrument1 image2)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(pointing satellite1 GroundStation3)
	(have_image Planet7 infrared3)
	(have_image Star8 thermograph1)
))

)
