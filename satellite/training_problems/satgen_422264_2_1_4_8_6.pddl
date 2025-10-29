; params: satgen 422264 2 1 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	thermograph0 - mode
	thermograph2 - mode
	infrared3 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation6 - direction
	Star7 - direction
	Star1 - direction
	Planet8 - direction
	Planet9 - direction
	Planet10 - direction
	Phenomenon11 - direction
	Planet12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 image1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet9)
	(supports instrument1 infrared3)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(pointing satellite1 Planet10)
	(have_image Planet8 infrared3)
	(have_image Planet9 image1)
	(have_image Planet10 thermograph0)
	(have_image Phenomenon11 image1)
	(have_image Planet12 thermograph2)
	(have_image Planet13 image1)
))

)
