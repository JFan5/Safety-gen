; params: satgen 95093 2 1 3 3 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	spectrograph2 - mode
	spectrograph1 - mode
	GroundStation2 - direction
	GroundStation0 - direction
	Star1 - direction
	Planet3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet3)
)
(:goal (and
	(pointing satellite0 Star1)
	(have_image Planet3 thermograph0)
	(have_image Planet4 thermograph0)
	(have_image Phenomenon5 thermograph0)
	(have_image Star6 spectrograph1)
	(have_image Phenomenon7 thermograph0)
))

)
