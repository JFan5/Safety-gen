; params: satgen 53386 1 3 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph1 - mode
	infrared2 - mode
	thermograph0 - mode
	Star3 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation1 - direction
	Star4 - direction
	Star0 - direction
	Star2 - direction
	Star8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Planet11 - direction
	Phenomenon12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star4)
	(supports instrument2 thermograph0)
	(supports instrument2 infrared2)
	(calibration_target instrument2 Star2)
	(calibration_target instrument2 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 GroundStation7)
	(have_image Star8 thermograph1)
	(have_image Planet9 thermograph0)
	(have_image Phenomenon10 thermograph1)
	(have_image Planet11 thermograph0)
	(have_image Phenomenon12 thermograph1)
	(have_image Star13 thermograph1)
))

)
