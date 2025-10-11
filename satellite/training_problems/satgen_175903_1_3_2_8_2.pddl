; params: satgen 175903 1 3 2 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared0 - mode
	infrared1 - mode
	Star1 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star0 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Star3 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 GroundStation5)
	(supports instrument2 infrared1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star3)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Star8 infrared0)
	(have_image Planet9 infrared0)
))

)
