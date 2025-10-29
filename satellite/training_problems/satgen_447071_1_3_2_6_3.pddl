; params: satgen 447071 1 3 2 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared1 - mode
	infrared0 - mode
	Star1 - direction
	Star4 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Star0 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation5)
	(supports instrument2 infrared0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 Star0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(have_image Phenomenon6 infrared0)
	(have_image Phenomenon7 infrared1)
	(have_image Star8 infrared0)
))

)
