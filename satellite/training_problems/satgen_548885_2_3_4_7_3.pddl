; params: satgen 548885 2 3 4 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	spectrograph3 - mode
	thermograph2 - mode
	GroundStation0 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph3)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 Star2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(have_image Phenomenon7 spectrograph3)
	(have_image Phenomenon8 spectrograph3)
	(have_image Star9 spectrograph3)
))

)
