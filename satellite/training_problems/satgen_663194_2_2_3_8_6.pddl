; params: satgen 663194 2 2 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph0 - mode
	image2 - mode
	thermograph1 - mode
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation5 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Planet11 - direction
	Planet12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation4)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation7)
	(supports instrument2 thermograph1)
	(supports instrument2 image2)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation0)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon10)
)
(:goal (and
	(pointing satellite0 GroundStation5)
	(pointing satellite1 GroundStation0)
	(have_image Planet8 image2)
	(have_image Phenomenon9 image2)
	(have_image Phenomenon10 thermograph0)
	(have_image Planet11 thermograph0)
	(have_image Planet12 thermograph1)
	(have_image Phenomenon13 thermograph0)
))

)
