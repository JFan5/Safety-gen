; params: satgen 720047 2 3 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared0 - mode
	thermograph1 - mode
	infrared2 - mode
	thermograph3 - mode
	Star1 - direction
	Star4 - direction
	Star5 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Star0 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 infrared0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 thermograph3)
	(calibration_target instrument2 Star0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon7)
)
(:goal (and
	(pointing satellite1 Star1)
	(have_image Star6 thermograph1)
	(have_image Phenomenon7 infrared2)
	(have_image Planet8 thermograph1)
))

)
