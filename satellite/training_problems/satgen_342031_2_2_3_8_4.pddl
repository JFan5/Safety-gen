; params: satgen 342031 2 2 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	infrared1 - mode
	thermograph2 - mode
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Star6 - direction
	Star5 - direction
	GroundStation1 - direction
	Star7 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation1)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument1 infrared1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star7)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite0 Planet9)
	(have_image Planet8 infrared1)
	(have_image Planet9 infrared1)
	(have_image Star10 thermograph0)
	(have_image Star11 thermograph0)
))

)
