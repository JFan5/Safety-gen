; params: satgen 593218 2 1 3 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	image0 - mode
	thermograph1 - mode
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation6 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star1 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon7)
)
(:goal (and
	(pointing satellite1 Star5)
	(have_image Phenomenon7 thermograph1)
	(have_image Planet8 image0)
))

)
