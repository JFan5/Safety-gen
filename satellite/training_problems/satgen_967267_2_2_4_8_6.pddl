; params: satgen 967267 2 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph0 - mode
	image1 - mode
	spectrograph3 - mode
	thermograph2 - mode
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star0 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
	Planet12 - direction
	Star13 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image1)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 thermograph2)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument2 spectrograph3)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star6)
	(calibration_target instrument2 GroundStation7)
	(supports instrument3 spectrograph3)
	(calibration_target instrument3 Star0)
	(calibration_target instrument3 GroundStation7)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(have_image Phenomenon8 thermograph0)
	(have_image Star9 thermograph0)
	(have_image Planet10 spectrograph3)
	(have_image Star11 spectrograph3)
	(have_image Planet12 image1)
	(have_image Star13 image1)
))

)
