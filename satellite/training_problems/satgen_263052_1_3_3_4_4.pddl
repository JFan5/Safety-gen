; params: satgen 263052 1 3 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared2 - mode
	image0 - mode
	thermograph1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 image0)
	(supports instrument2 infrared2)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(pointing satellite0 Star5)
	(have_image Star4 image0)
	(have_image Star5 thermograph1)
	(have_image Planet6 infrared2)
	(have_image Star7 image0)
))

)
