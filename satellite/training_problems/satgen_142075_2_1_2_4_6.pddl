; params: satgen 142075 2 1 2 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(pointing satellite1 Planet5)
	(have_image Star4 spectrograph1)
	(have_image Planet5 thermograph0)
	(have_image Phenomenon6 thermograph0)
	(have_image Star7 thermograph0)
	(have_image Star8 spectrograph1)
	(have_image Planet9 spectrograph1)
))

)
