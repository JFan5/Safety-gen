; params: satgen 428958 2 1 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	infrared2 - mode
	image3 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	Star6 - direction
	GroundStation2 - direction
	Star1 - direction
	GroundStation5 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 image3)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite0 Star8)
	(pointing satellite1 Star7)
	(have_image Star7 image3)
	(have_image Star8 thermograph0)
))

)
