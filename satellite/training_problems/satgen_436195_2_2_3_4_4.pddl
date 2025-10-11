; params: satgen 436195 2 2 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	thermograph0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	GroundStation3 - direction
	Star2 - direction
	GroundStation1 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument1 image2)
	(calibration_target instrument1 Star2)
	(supports instrument2 image2)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Star4 spectrograph1)
	(have_image Star5 image2)
	(have_image Planet6 spectrograph1)
	(have_image Planet7 thermograph0)
))

)
