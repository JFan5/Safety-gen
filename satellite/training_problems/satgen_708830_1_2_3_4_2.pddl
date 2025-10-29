; params: satgen 708830 1 2 3 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	thermograph0 - mode
	thermograph2 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star1 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Phenomenon4)
	(have_image Phenomenon4 thermograph2)
	(have_image Phenomenon5 thermograph1)
))

)
