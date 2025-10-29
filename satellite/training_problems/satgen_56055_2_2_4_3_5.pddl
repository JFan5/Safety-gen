; params: satgen 56055 2 2 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph3 - mode
	image0 - mode
	thermograph2 - mode
	thermograph1 - mode
	GroundStation2 - direction
	Star0 - direction
	GroundStation1 - direction
	Star3 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph3)
	(supports instrument1 image0)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument2 spectrograph3)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 Star0)
	(supports instrument3 spectrograph3)
	(supports instrument3 thermograph1)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(have_image Star3 spectrograph3)
	(have_image Planet4 image0)
	(have_image Star5 thermograph1)
	(have_image Planet6 thermograph1)
	(have_image Phenomenon7 thermograph1)
))

)
