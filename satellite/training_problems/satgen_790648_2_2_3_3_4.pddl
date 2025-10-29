; params: satgen 790648 2 2 3 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image1 - mode
	infrared0 - mode
	image2 - mode
	GroundStation2 - direction
	Star1 - direction
	GroundStation0 - direction
	Planet3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(supports instrument1 image1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 image2)
	(supports instrument2 infrared0)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation0)
	(supports instrument3 image2)
	(supports instrument3 infrared0)
	(supports instrument3 image1)
	(calibration_target instrument3 GroundStation0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(have_image Planet3 image1)
	(have_image Planet4 image2)
	(have_image Star5 infrared0)
	(have_image Planet6 infrared0)
))

)
