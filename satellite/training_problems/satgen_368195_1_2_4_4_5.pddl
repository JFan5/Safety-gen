; params: satgen 368195 1 2 4 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared3 - mode
	thermograph1 - mode
	image2 - mode
	infrared0 - mode
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star0 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(supports instrument0 infrared3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Planet4 infrared0)
	(have_image Star5 infrared0)
	(have_image Planet6 infrared0)
	(have_image Star7 image2)
	(have_image Star8 infrared3)
))

)
