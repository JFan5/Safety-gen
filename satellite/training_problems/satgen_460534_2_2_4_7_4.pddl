; params: satgen 460534 2 2 4 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph0 - mode
	spectrograph2 - mode
	spectrograph3 - mode
	thermograph1 - mode
	Star1 - direction
	GroundStation4 - direction
	Star6 - direction
	Star3 - direction
	Star2 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star3)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
	(supports instrument2 spectrograph0)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 GroundStation5)
	(calibration_target instrument2 Star2)
	(supports instrument3 spectrograph2)
	(calibration_target instrument3 GroundStation0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(have_image Phenomenon7 spectrograph0)
	(have_image Planet8 spectrograph2)
	(have_image Planet9 spectrograph2)
	(have_image Star10 thermograph1)
))

)
