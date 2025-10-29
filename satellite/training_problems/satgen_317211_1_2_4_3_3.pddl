; params: satgen 317211 1 2 4 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared1 - mode
	thermograph0 - mode
	thermograph3 - mode
	infrared2 - mode
	GroundStation2 - direction
	Star1 - direction
	GroundStation0 - direction
	Star3 - direction
	Phenomenon4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star3 infrared1)
	(have_image Phenomenon4 infrared1)
	(have_image Star5 thermograph3)
))

)
