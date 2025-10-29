; params: satgen 538834 2 1 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph2 - mode
	infrared0 - mode
	spectrograph3 - mode
	infrared1 - mode
	GroundStation1 - direction
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument1 spectrograph3)
	(supports instrument1 thermograph2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(have_image Star3 spectrograph3)
	(have_image Phenomenon4 infrared0)
	(have_image Phenomenon5 infrared0)
	(have_image Planet6 thermograph2)
	(have_image Star7 infrared1)
))

)
