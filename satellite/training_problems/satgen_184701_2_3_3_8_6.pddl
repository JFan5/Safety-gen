; params: satgen 184701 2 3 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	thermograph2 - mode
	infrared0 - mode
	image1 - mode
	Star0 - direction
	Star4 - direction
	GroundStation5 - direction
	Star1 - direction
	Star6 - direction
	Star3 - direction
	GroundStation2 - direction
	Star7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
	Phenomenon12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 Star7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument2 infrared0)
	(calibration_target instrument2 GroundStation2)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 Star3)
	(calibration_target instrument3 GroundStation2)
	(supports instrument4 thermograph2)
	(supports instrument4 infrared0)
	(calibration_target instrument4 Star7)
	(calibration_target instrument4 GroundStation2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon9)
)
(:goal (and
	(pointing satellite0 Star8)
	(have_image Star8 infrared0)
	(have_image Phenomenon9 thermograph2)
	(have_image Phenomenon10 thermograph2)
	(have_image Phenomenon11 infrared0)
	(have_image Phenomenon12 infrared0)
	(have_image Phenomenon13 image1)
))

)
