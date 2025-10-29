; params: satgen 786922 1 1 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	image1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation3 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(have_image Planet7 image1)
	(have_image Phenomenon8 image1)
	(have_image Planet9 image1)
	(have_image Star10 thermograph0)
))

)
