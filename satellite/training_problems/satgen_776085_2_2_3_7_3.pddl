; params: satgen 776085 2 2 3 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image2 - mode
	thermograph1 - mode
	infrared0 - mode
	GroundStation4 - direction
	Star5 - direction
	Star6 - direction
	Star1 - direction
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 Star3)
	(supports instrument1 image2)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
	(supports instrument2 thermograph1)
	(supports instrument2 image2)
	(supports instrument2 infrared0)
	(calibration_target instrument2 GroundStation2)
	(calibration_target instrument2 Star0)
	(supports instrument3 image2)
	(calibration_target instrument3 Star3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite1 Planet8)
	(have_image Phenomenon7 thermograph1)
	(have_image Planet8 image2)
	(have_image Phenomenon9 thermograph1)
))

)
