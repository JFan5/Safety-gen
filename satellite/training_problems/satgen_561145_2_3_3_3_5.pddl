; params: satgen 561145 2 3 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	image1 - mode
	thermograph0 - mode
	thermograph2 - mode
	GroundStation2 - direction
	GroundStation0 - direction
	Star1 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
	(supports instrument3 thermograph2)
	(supports instrument3 image1)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 GroundStation2)
	(supports instrument4 thermograph0)
	(supports instrument4 thermograph2)
	(supports instrument4 image1)
	(calibration_target instrument4 GroundStation0)
	(supports instrument5 image1)
	(supports instrument5 thermograph2)
	(supports instrument5 thermograph0)
	(calibration_target instrument5 Star1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(have_image Phenomenon3 image1)
	(have_image Planet4 thermograph0)
	(have_image Star5 thermograph2)
	(have_image Planet6 image1)
	(have_image Planet7 thermograph0)
))

)
