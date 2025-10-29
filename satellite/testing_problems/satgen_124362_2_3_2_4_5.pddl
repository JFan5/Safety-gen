; params: satgen 124362 2 3 2 4 5
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
	instrument5 - instrument
	image0 - mode
	image1 - mode
	GroundStation3 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	Planet4 - direction
	Planet5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 image1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument3 image1)
	(calibration_target instrument3 GroundStation0)
	(supports instrument4 image0)
	(supports instrument4 image1)
	(calibration_target instrument4 GroundStation2)
	(supports instrument5 image0)
	(supports instrument5 image1)
	(calibration_target instrument5 GroundStation1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Planet4 image1)
	(have_image Planet5 image0)
	(have_image Planet6 image1)
	(have_image Phenomenon7 image0)
	(have_image Planet8 image1)
))

)
