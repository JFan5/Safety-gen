; params: satgen 419549 2 2 4 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared2 - mode
	thermograph0 - mode
	spectrograph3 - mode
	image1 - mode
	Star3 - direction
	GroundStation6 - direction
	GroundStation5 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation4 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 Star1)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 image1)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph3)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation4)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(have_image Phenomenon7 infrared2)
	(have_image Phenomenon8 image1)
	(have_image Planet9 thermograph0)
	(have_image Planet10 image1)
	(have_image Star11 thermograph0)
))

)
