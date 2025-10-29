; params: satgen 968597 1 1 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	image3 - mode
	thermograph2 - mode
	image0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 image3)
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Phenomenon3 image0)
	(have_image Planet4 thermograph2)
	(have_image Planet5 thermograph2)
	(have_image Planet6 thermograph2)
	(have_image Planet7 thermograph2)
	(have_image Planet8 image0)
))

)
