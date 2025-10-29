; params: satgen 160962 2 2 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph0 - mode
	thermograph1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation1 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument2 thermograph1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Phenomenon4 thermograph0)
	(have_image Phenomenon5 thermograph1)
	(have_image Planet6 thermograph0)
	(have_image Star7 thermograph1)
	(have_image Phenomenon8 thermograph1)
))

)
