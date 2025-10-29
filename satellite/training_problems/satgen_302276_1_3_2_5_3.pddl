; params: satgen 302276 1 3 2 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph0 - mode
	thermograph1 - mode
	GroundStation1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation0 - direction
	Star3 - direction
	Star5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Star5 spectrograph0)
	(have_image Phenomenon6 spectrograph0)
	(have_image Phenomenon7 thermograph1)
))

)
