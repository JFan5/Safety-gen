; params: satgen 877200 1 3 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image3 - mode
	spectrograph0 - mode
	thermograph1 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	GroundStation4 - direction
	Star2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 image3)
	(supports instrument2 spectrograph0)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Star5 thermograph1)
	(have_image Planet6 spectrograph2)
	(have_image Phenomenon7 spectrograph0)
))

)
