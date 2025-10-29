; params: satgen 188907 1 1 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	image2 - mode
	thermograph1 - mode
	infrared3 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Star0 - direction
	GroundStation3 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 infrared3)
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
)
(:goal (and
	(have_image Planet6 thermograph1)
	(have_image Phenomenon7 thermograph1)
	(have_image Star8 thermograph1)
	(have_image Planet9 thermograph0)
	(have_image Star10 thermograph0)
))

)
