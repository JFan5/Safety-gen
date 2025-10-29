; params: satgen 555226 2 2 2 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared0 - mode
	image1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	Phenomenon3 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 image1)
	(calibration_target instrument1 Star1)
	(supports instrument2 infrared0)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite1 Planet6)
	(have_image Phenomenon3 image1)
	(have_image Star4 infrared0)
	(have_image Star5 infrared0)
	(have_image Planet6 image1)
	(have_image Star7 image1)
))

)
