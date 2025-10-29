; params: satgen 738370 2 1 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite1 GroundStation3)
	(have_image Planet4 thermograph0)
	(have_image Phenomenon5 spectrograph2)
	(have_image Phenomenon6 spectrograph1)
	(have_image Star7 thermograph0)
))

)
