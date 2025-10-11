; params: satgen 559906 1 3 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	infrared1 - mode
	thermograph0 - mode
	image3 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 infrared1)
	(supports instrument1 thermograph0)
	(supports instrument1 image2)
	(calibration_target instrument1 Star1)
	(supports instrument2 image2)
	(supports instrument2 image3)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Star3 image3)
	(have_image Star4 thermograph0)
	(have_image Planet5 thermograph0)
	(have_image Planet6 thermograph0)
	(have_image Planet7 thermograph0)
))

)
