; params: satgen 466322 1 1 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	image2 - mode
	image3 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation0 - direction
	GroundStation5 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Planet6 thermograph0)
	(have_image Planet7 thermograph0)
	(have_image Phenomenon8 image3)
	(have_image Star9 image2)
	(have_image Planet10 thermograph1)
	(have_image Star11 thermograph1)
))

)
