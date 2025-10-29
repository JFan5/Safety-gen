; params: satgen 418352 1 2 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared1 - mode
	thermograph2 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star0)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Star3 thermograph0)
	(have_image Planet4 thermograph2)
	(have_image Phenomenon5 thermograph2)
))

)
