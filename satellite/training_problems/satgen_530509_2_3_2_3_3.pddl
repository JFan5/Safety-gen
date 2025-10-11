; params: satgen 530509 2 3 2 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	infrared0 - mode
	image1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Planet3 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument2 image1)
	(supports instrument2 infrared0)
	(calibration_target instrument2 Star0)
	(supports instrument3 image1)
	(supports instrument3 infrared0)
	(calibration_target instrument3 Star0)
	(supports instrument4 infrared0)
	(supports instrument4 image1)
	(calibration_target instrument4 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(have_image Planet3 infrared0)
	(have_image Star4 infrared0)
	(have_image Planet5 image1)
))

)
