; params: satgen 487999 1 3 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	infrared1 - mode
	image2 - mode
	thermograph3 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 infrared1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 image2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 image2)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Phenomenon4 thermograph0)
	(have_image Planet5 thermograph3)
	(have_image Phenomenon6 thermograph3)
	(have_image Star7 thermograph3)
	(have_image Phenomenon8 thermograph3)
	(have_image Phenomenon9 image2)
))

)
