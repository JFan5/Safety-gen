; params: satgen 433864 2 3 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	infrared1 - mode
	infrared0 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation4 - direction
	Star0 - direction
	Star2 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 infrared1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument3 infrared1)
	(supports instrument3 infrared0)
	(calibration_target instrument3 GroundStation4)
	(calibration_target instrument3 GroundStation5)
	(supports instrument4 infrared0)
	(supports instrument4 infrared1)
	(calibration_target instrument4 Star2)
	(calibration_target instrument4 Star0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite0 GroundStation5)
	(have_image Phenomenon6 infrared1)
	(have_image Star7 infrared0)
	(have_image Planet8 infrared0)
))

)
