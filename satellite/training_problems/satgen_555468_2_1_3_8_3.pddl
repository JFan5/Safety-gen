; params: satgen 555468 2 1 3 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	infrared2 - mode
	thermograph1 - mode
	GroundStation3 - direction
	Star4 - direction
	Star6 - direction
	Star7 - direction
	GroundStation1 - direction
	Star0 - direction
	Star5 - direction
	GroundStation2 - direction
	Planet8 - direction
	Star9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation2)
	(calibration_target instrument1 Star5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star9)
)
(:goal (and
	(pointing satellite0 Star5)
	(pointing satellite1 Star7)
	(have_image Planet8 thermograph1)
	(have_image Star9 infrared2)
	(have_image Phenomenon10 infrared2)
))

)
