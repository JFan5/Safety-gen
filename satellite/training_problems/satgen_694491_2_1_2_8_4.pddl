; params: satgen 694491 2 1 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	thermograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation4 - direction
	Star6 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star5 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation3)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon10)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star7)
	(calibration_target instrument1 Star5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 Phenomenon9)
	(have_image Planet8 thermograph0)
	(have_image Phenomenon9 image1)
	(have_image Phenomenon10 thermograph0)
	(have_image Planet11 image1)
))

)
