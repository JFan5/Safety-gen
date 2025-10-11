; params: satgen 835288 2 3 3 6 4
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
	infrared2 - mode
	infrared1 - mode
	image0 - mode
	GroundStation4 - direction
	Star5 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star1 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared2)
	(supports instrument1 image0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 image0)
	(supports instrument2 infrared2)
	(calibration_target instrument2 GroundStation3)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument3 image0)
	(supports instrument3 infrared1)
	(supports instrument3 infrared2)
	(calibration_target instrument3 Star1)
	(supports instrument4 infrared2)
	(supports instrument4 image0)
	(calibration_target instrument4 Star1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Star6 infrared2)
	(have_image Star7 infrared2)
	(have_image Planet8 image0)
	(have_image Star9 infrared2)
))

)
