; params: satgen 275013 2 3 4 7 5
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
	spectrograph0 - mode
	image3 - mode
	spectrograph2 - mode
	spectrograph1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	Star0 - direction
	GroundStation6 - direction
	Star4 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star4)
	(supports instrument1 spectrograph0)
	(supports instrument1 image3)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation2)
	(supports instrument3 image3)
	(supports instrument3 spectrograph2)
	(supports instrument3 spectrograph1)
	(calibration_target instrument3 GroundStation6)
	(calibration_target instrument3 Star0)
	(supports instrument4 spectrograph2)
	(supports instrument4 image3)
	(calibration_target instrument4 Star4)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite0 Planet7)
	(have_image Planet7 spectrograph0)
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph1)
	(have_image Star10 spectrograph0)
	(have_image Planet11 image3)
))

)
