; params: satgen 698556 1 3 2 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared1 - mode
	thermograph0 - mode
	Star0 - direction
	GroundStation3 - direction
	Star4 - direction
	Star2 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 GroundStation5)
	(supports instrument2 thermograph0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Star6 infrared1)
	(have_image Phenomenon7 thermograph0)
))

)
