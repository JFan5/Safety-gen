; params: satgen 307183 2 2 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph0 - mode
	thermograph1 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation1)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(have_image Planet6 spectrograph0)
	(have_image Star7 spectrograph0)
	(have_image Planet8 spectrograph0)
	(have_image Star9 spectrograph0)
	(have_image Star10 spectrograph0)
))

)
