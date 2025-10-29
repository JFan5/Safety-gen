; params: satgen 464012 2 3 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	infrared1 - mode
	image0 - mode
	thermograph3 - mode
	infrared2 - mode
	GroundStation1 - direction
	Star3 - direction
	Star5 - direction
	GroundStation0 - direction
	GroundStation4 - direction
	Star2 - direction
	Star6 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation4)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument1 infrared1)
	(supports instrument1 thermograph3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation4)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation4)
	(supports instrument3 thermograph3)
	(supports instrument3 infrared2)
	(supports instrument3 infrared1)
	(supports instrument3 image0)
	(calibration_target instrument3 Star2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(have_image Star6 thermograph3)
	(have_image Planet7 infrared1)
	(have_image Phenomenon8 image0)
))

)
