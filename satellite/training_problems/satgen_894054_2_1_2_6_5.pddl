; params: satgen 894054 2 1 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	thermograph0 - mode
	Star2 - direction
	GroundStation3 - direction
	Star5 - direction
	Star4 - direction
	Star0 - direction
	GroundStation1 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Planet6 thermograph1)
	(have_image Phenomenon7 thermograph0)
	(have_image Phenomenon8 thermograph0)
	(have_image Star9 thermograph0)
	(have_image Phenomenon10 thermograph0)
))

)
