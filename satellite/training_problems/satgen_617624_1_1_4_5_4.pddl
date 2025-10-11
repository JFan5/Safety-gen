; params: satgen 617624 1 1 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	image0 - mode
	thermograph3 - mode
	spectrograph2 - mode
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star1 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph3)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(have_image Phenomenon5 thermograph3)
	(have_image Phenomenon6 spectrograph2)
	(have_image Star7 thermograph3)
	(have_image Planet8 image0)
))

)
