; params: satgen 489612 2 1 3 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	infrared2 - mode
	image1 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star0 - direction
	Planet4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet4)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Planet4 infrared2)
	(have_image Planet5 thermograph0)
))

)
