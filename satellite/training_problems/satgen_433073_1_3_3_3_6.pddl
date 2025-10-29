; params: satgen 433073 1 3 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph1 - mode
	infrared0 - mode
	infrared2 - mode
	Star1 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Planet3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(pointing satellite0 Phenomenon8)
	(have_image Planet3 infrared2)
	(have_image Phenomenon4 infrared2)
	(have_image Phenomenon5 infrared2)
	(have_image Star6 infrared2)
	(have_image Planet7 thermograph1)
	(have_image Phenomenon8 thermograph1)
))

)
