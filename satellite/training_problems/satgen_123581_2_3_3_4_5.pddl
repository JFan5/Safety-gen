; params: satgen 123581 2 3 3 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	image1 - mode
	thermograph0 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	Star0 - direction
	GroundStation3 - direction
	GroundStation2 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 thermograph0)
	(supports instrument1 image1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 Star0)
	(supports instrument3 image1)
	(supports instrument3 spectrograph2)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 GroundStation3)
	(supports instrument4 spectrograph2)
	(supports instrument4 thermograph0)
	(supports instrument4 image1)
	(calibration_target instrument4 GroundStation2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(pointing satellite1 Planet4)
	(have_image Planet4 spectrograph2)
	(have_image Star5 thermograph0)
	(have_image Planet6 image1)
	(have_image Star7 spectrograph2)
	(have_image Phenomenon8 spectrograph2)
))

)
