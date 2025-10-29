; params: satgen 512335 2 2 3 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image0 - mode
	infrared2 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	Planet5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation4)
	(supports instrument2 infrared2)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Planet5 infrared1)
	(have_image Phenomenon6 image0)
))

)
