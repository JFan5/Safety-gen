; params: satgen 170464 2 3 2 5 5
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
	thermograph0 - mode
	infrared1 - mode
	GroundStation2 - direction
	GroundStation4 - direction
	Star0 - direction
	Star3 - direction
	GroundStation1 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 Star3)
	(supports instrument4 infrared1)
	(supports instrument4 thermograph0)
	(calibration_target instrument4 GroundStation1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(have_image Star5 thermograph0)
	(have_image Planet6 thermograph0)
	(have_image Planet7 infrared1)
	(have_image Star8 infrared1)
	(have_image Planet9 infrared1)
))

)
