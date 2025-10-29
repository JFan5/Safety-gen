; params: satgen 572873 1 2 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph2 - mode
	image3 - mode
	infrared0 - mode
	image1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation4 - direction
	Star0 - direction
	Star2 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 image1)
	(supports instrument1 image3)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(have_image Planet7 image1)
	(have_image Phenomenon8 thermograph2)
))

)
