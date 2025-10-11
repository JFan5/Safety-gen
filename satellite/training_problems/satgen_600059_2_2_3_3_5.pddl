; params: satgen 600059 2 2 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared2 - mode
	image1 - mode
	thermograph0 - mode
	GroundStation2 - direction
	Star0 - direction
	Star1 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument2 thermograph0)
	(supports instrument2 infrared2)
	(calibration_target instrument2 Star1)
	(supports instrument3 infrared2)
	(calibration_target instrument3 Star1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon5)
)
(:goal (and
	(have_image Phenomenon3 infrared2)
	(have_image Phenomenon4 infrared2)
	(have_image Phenomenon5 thermograph0)
	(have_image Planet6 image1)
	(have_image Star7 thermograph0)
))

)
