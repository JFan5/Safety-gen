; params: satgen 739442 1 3 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	infrared2 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star0 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
)
(:goal (and
	(pointing satellite0 Star0)
	(have_image Star4 thermograph0)
	(have_image Planet5 thermograph0)
	(have_image Planet6 thermograph0)
	(have_image Planet7 thermograph0)
))

)
