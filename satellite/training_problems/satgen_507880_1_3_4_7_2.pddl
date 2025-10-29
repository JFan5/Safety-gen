; params: satgen 507880 1 3 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image2 - mode
	image0 - mode
	thermograph3 - mode
	thermograph1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star3 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph3)
	(supports instrument0 image0)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 Star3)
	(supports instrument1 thermograph1)
	(supports instrument1 thermograph3)
	(supports instrument1 image0)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
)
(:goal (and
	(have_image Phenomenon7 thermograph1)
	(have_image Star8 image0)
))

)
