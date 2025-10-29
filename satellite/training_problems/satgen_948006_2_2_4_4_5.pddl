; params: satgen 948006 2 2 4 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared1 - mode
	thermograph3 - mode
	infrared2 - mode
	infrared0 - mode
	GroundStation2 - direction
	Star3 - direction
	GroundStation0 - direction
	Star1 - direction
	Planet4 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 infrared1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 thermograph3)
	(calibration_target instrument2 Star1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite1 Star3)
	(have_image Planet4 thermograph3)
	(have_image Planet5 infrared0)
	(have_image Star6 thermograph3)
	(have_image Phenomenon7 infrared1)
	(have_image Star8 infrared1)
))

)
