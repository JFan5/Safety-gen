; params: satgen 368255 1 2 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph3 - mode
	infrared2 - mode
	infrared1 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	Star1 - direction
	GroundStation4 - direction
	Planet5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph3)
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Planet5 infrared2)
	(have_image Planet6 thermograph3)
))

)
