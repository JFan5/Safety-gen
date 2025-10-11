; params: satgen 440458 2 3 2 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	thermograph1 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Planet11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation4)
	(calibration_target instrument1 Star3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 Phenomenon8)
	(have_image Phenomenon8 infrared0)
	(have_image Planet9 thermograph1)
	(have_image Phenomenon10 thermograph1)
	(have_image Planet11 infrared0)
	(have_image Planet12 thermograph1)
))

)
