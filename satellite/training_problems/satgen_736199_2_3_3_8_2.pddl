; params: satgen 736199 2 3 3 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	thermograph1 - mode
	infrared2 - mode
	image0 - mode
	Star1 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	Star0 - direction
	GroundStation4 - direction
	Star2 - direction
	GroundStation6 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(supports instrument1 image0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star2)
	(supports instrument2 thermograph1)
	(supports instrument2 infrared2)
	(supports instrument2 image0)
	(calibration_target instrument2 Star2)
	(calibration_target instrument2 GroundStation6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
	(supports instrument3 thermograph1)
	(supports instrument3 image0)
	(calibration_target instrument3 GroundStation4)
	(supports instrument4 image0)
	(supports instrument4 infrared2)
	(calibration_target instrument4 GroundStation6)
	(calibration_target instrument4 Star2)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(have_image Planet8 infrared2)
	(have_image Planet9 infrared2)
))

)
