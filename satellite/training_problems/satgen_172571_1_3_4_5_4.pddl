; params: satgen 172571 1 3 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared2 - mode
	thermograph0 - mode
	image3 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 thermograph0)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 thermograph1)
	(supports instrument2 infrared2)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
)
(:goal (and
	(have_image Phenomenon5 thermograph1)
	(have_image Star6 thermograph1)
	(have_image Phenomenon7 image3)
	(have_image Planet8 infrared2)
))

)
