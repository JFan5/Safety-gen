; params: satgen 564390 1 1 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	thermograph0 - mode
	thermograph2 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star0 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Planet4 thermograph2)
	(have_image Star5 thermograph2)
	(have_image Star6 thermograph0)
	(have_image Phenomenon7 thermograph0)
))

)
