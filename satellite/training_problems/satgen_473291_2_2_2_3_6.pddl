; params: satgen 473291 2 2 2 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph1 - mode
	thermograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 thermograph1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(have_image Phenomenon3 thermograph0)
	(have_image Planet4 thermograph0)
	(have_image Phenomenon5 thermograph1)
	(have_image Star6 thermograph0)
	(have_image Planet7 thermograph1)
	(have_image Planet8 thermograph0)
))

)
