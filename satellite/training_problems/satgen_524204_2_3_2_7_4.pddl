; params: satgen 524204 2 3 2 7 4
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
	GroundStation2 - direction
	GroundStation3 - direction
	Star6 - direction
	Star1 - direction
	Star4 - direction
	Star5 - direction
	GroundStation0 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star5)
	(supports instrument2 infrared0)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(pointing satellite1 Star4)
	(have_image Star7 infrared0)
	(have_image Phenomenon8 infrared0)
	(have_image Phenomenon9 infrared0)
	(have_image Planet10 infrared0)
))

)
