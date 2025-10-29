; params: satgen 361700 2 2 3 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared2 - mode
	image0 - mode
	image1 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation4 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 infrared2)
	(supports instrument2 image1)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation4)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(have_image Star6 infrared2)
	(have_image Phenomenon7 image0)
	(have_image Planet8 image0)
))

)
