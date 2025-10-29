; params: satgen 348604 2 1 2 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Star4 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument1 infrared0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star4)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite1 GroundStation2)
	(have_image Planet6 image1)
	(have_image Phenomenon7 image1)
))

)
