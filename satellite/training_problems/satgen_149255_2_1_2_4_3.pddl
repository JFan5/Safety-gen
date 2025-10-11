; params: satgen 149255 2 1 2 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star1 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(have_image Phenomenon4 thermograph0)
	(have_image Planet5 spectrograph1)
	(have_image Star6 thermograph0)
))

)
