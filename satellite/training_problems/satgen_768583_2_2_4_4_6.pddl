; params: satgen 768583 2 2 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph2 - mode
	spectrograph0 - mode
	spectrograph3 - mode
	thermograph1 - mode
	GroundStation3 - direction
	Star1 - direction
	Star0 - direction
	Star2 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet4)
)
(:goal (and
	(have_image Planet4 spectrograph0)
	(have_image Star5 spectrograph3)
	(have_image Star6 thermograph1)
	(have_image Star7 spectrograph3)
	(have_image Star8 spectrograph0)
	(have_image Planet9 thermograph1)
))

)
