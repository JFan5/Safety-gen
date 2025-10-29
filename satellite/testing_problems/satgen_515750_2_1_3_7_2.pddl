; params: satgen 515750 2 1 3 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	thermograph0 - mode
	thermograph1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star5 - direction
	GroundStation6 - direction
	Star4 - direction
	GroundStation3 - direction
	Star0 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon7)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Phenomenon7 thermograph0)
	(have_image Planet8 thermograph1)
))

)
