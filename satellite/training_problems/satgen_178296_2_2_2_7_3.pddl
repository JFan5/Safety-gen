; params: satgen 178296 2 2 2 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared0 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation3)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument2 infrared0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation2)
	(supports instrument3 infrared0)
	(supports instrument3 infrared1)
	(calibration_target instrument3 GroundStation0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Star7 infrared1)
	(have_image Planet8 infrared1)
	(have_image Phenomenon9 infrared1)
))

)
