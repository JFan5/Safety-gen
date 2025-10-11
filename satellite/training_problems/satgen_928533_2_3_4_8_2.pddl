; params: satgen 928533 2 3 4 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	thermograph3 - mode
	thermograph0 - mode
	infrared2 - mode
	thermograph1 - mode
	GroundStation2 - direction
	Star6 - direction
	GroundStation7 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star4)
	(supports instrument1 thermograph1)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument2 thermograph1)
	(supports instrument2 thermograph3)
	(supports instrument2 infrared2)
	(calibration_target instrument2 GroundStation5)
	(supports instrument3 thermograph1)
	(supports instrument3 thermograph0)
	(supports instrument3 infrared2)
	(calibration_target instrument3 Star3)
	(calibration_target instrument3 GroundStation0)
	(supports instrument4 thermograph1)
	(calibration_target instrument4 GroundStation5)
	(calibration_target instrument4 Star4)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Phenomenon8 thermograph3)
	(have_image Star9 thermograph0)
))

)
