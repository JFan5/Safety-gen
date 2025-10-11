; params: satgen 888851 2 2 4 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph1 - mode
	thermograph2 - mode
	image3 - mode
	infrared0 - mode
	GroundStation2 - direction
	Star4 - direction
	GroundStation5 - direction
	Star0 - direction
	Star1 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star3 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 Star3)
	(supports instrument1 image3)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 GroundStation6)
	(calibration_target instrument2 Star1)
	(supports instrument3 image3)
	(supports instrument3 infrared0)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 Star3)
	(calibration_target instrument3 GroundStation7)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet11)
)
(:goal (and
	(pointing satellite0 GroundStation5)
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph1)
	(have_image Star10 thermograph2)
	(have_image Planet11 spectrograph1)
))

)
