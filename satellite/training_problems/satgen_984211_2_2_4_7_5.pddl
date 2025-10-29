; params: satgen 984211 2 2 4 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	image3 - mode
	infrared1 - mode
	infrared0 - mode
	image2 - mode
	Star1 - direction
	Star4 - direction
	Star5 - direction
	Star3 - direction
	Star6 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 Star3)
	(supports instrument1 image3)
	(supports instrument1 infrared0)
	(calibration_target instrument1 GroundStation2)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
	(supports instrument2 image3)
	(supports instrument2 image2)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation2)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(have_image Star7 infrared1)
	(have_image Planet8 infrared0)
	(have_image Phenomenon9 image2)
	(have_image Phenomenon10 infrared1)
	(have_image Planet11 infrared0)
))

)
