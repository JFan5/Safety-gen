; params: satgen 859364 2 2 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	image1 - mode
	infrared2 - mode
	thermograph3 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star4 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star5 - direction
	Star3 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument2 image1)
	(supports instrument2 infrared2)
	(calibration_target instrument2 Star6)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite1 Star3)
	(have_image Star7 thermograph3)
	(have_image Star8 thermograph3)
))

)
