; params: satgen 772034 2 2 2 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	image0 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	GroundStation2 - direction
	Star0 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star0)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(have_image Phenomenon6 thermograph1)
	(have_image Star7 image0)
	(have_image Phenomenon8 thermograph1)
	(have_image Phenomenon9 image0)
))

)
