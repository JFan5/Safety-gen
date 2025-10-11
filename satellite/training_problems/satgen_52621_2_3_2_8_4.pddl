; params: satgen 52621 2 3 2 8 4
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
	image0 - mode
	thermograph1 - mode
	Star3 - direction
	GroundStation7 - direction
	GroundStation0 - direction
	Star2 - direction
	Star5 - direction
	Star6 - direction
	Star4 - direction
	GroundStation1 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument2 thermograph1)
	(supports instrument2 image0)
	(calibration_target instrument2 Star6)
	(calibration_target instrument2 Star5)
	(supports instrument3 image0)
	(calibration_target instrument3 Star4)
	(supports instrument4 thermograph1)
	(calibration_target instrument4 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Phenomenon8 image0)
	(have_image Phenomenon9 image0)
	(have_image Planet10 image0)
	(have_image Planet11 image0)
))

)
