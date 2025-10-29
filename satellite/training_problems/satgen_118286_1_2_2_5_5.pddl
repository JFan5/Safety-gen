; params: satgen 118286 1 2 2 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	Star0 - direction
	Star1 - direction
	Star3 - direction
	Star2 - direction
	GroundStation4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Star5 thermograph0)
	(have_image Planet6 spectrograph1)
	(have_image Planet7 spectrograph1)
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph1)
))

)
