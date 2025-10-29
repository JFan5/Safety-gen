; params: satgen 704469 2 2 3 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image0 - mode
	infrared2 - mode
	infrared1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument2 infrared2)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation2)
	(supports instrument3 infrared1)
	(supports instrument3 infrared2)
	(calibration_target instrument3 GroundStation0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet5)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Planet5 infrared2)
	(have_image Phenomenon6 infrared1)
))

)
