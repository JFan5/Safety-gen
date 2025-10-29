; params: satgen 473671 2 1 4 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image3 - mode
	infrared0 - mode
	thermograph1 - mode
	spectrograph2 - mode
	Star0 - direction
	Star1 - direction
	Star4 - direction
	Star2 - direction
	GroundStation3 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument1 image3)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet9)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Phenomenon5 spectrograph2)
	(have_image Phenomenon6 spectrograph2)
	(have_image Star7 image3)
	(have_image Planet8 infrared0)
	(have_image Planet9 thermograph1)
))

)
