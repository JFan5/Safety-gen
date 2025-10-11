; params: satgen 912165 2 3 3 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	image0 - mode
	image2 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star6 - direction
	Star7 - direction
	Star4 - direction
	Star1 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 infrared1)
	(supports instrument1 image2)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 Star4)
	(supports instrument2 image2)
	(supports instrument2 image0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument3 infrared1)
	(supports instrument3 image0)
	(supports instrument3 image2)
	(calibration_target instrument3 GroundStation3)
	(supports instrument4 infrared1)
	(supports instrument4 image2)
	(supports instrument4 image0)
	(calibration_target instrument4 GroundStation2)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(have_image Planet8 image0)
	(have_image Phenomenon9 image2)
	(have_image Phenomenon10 infrared1)
))

)
