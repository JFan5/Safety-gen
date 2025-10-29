; params: satgen 373715 2 2 4 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	spectrograph3 - mode
	spectrograph2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation6 - direction
	GroundStation5 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star7)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation6)
	(calibration_target instrument1 Star4)
	(supports instrument2 spectrograph2)
	(supports instrument2 spectrograph3)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite1 Star3)
	(have_image Star7 thermograph0)
	(have_image Phenomenon8 spectrograph1)
	(have_image Phenomenon9 spectrograph2)
))

)
