; params: satgen 59236 2 1 4 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	image3 - mode
	spectrograph2 - mode
	thermograph1 - mode
	Star2 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon4)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph2)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(pointing satellite0 Planet5)
	(pointing satellite1 Planet5)
	(have_image Star3 image3)
	(have_image Phenomenon4 spectrograph2)
	(have_image Planet5 spectrograph2)
	(have_image Planet6 thermograph1)
	(have_image Phenomenon7 thermograph1)
))

)
