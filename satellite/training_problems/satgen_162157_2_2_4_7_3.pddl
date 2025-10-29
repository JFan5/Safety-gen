; params: satgen 162157 2 2 4 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	thermograph2 - mode
	thermograph0 - mode
	spectrograph3 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star4 - direction
	Star5 - direction
	Star3 - direction
	Star0 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 Star5)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph3)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 Star6)
	(calibration_target instrument2 Star0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(have_image Phenomenon7 thermograph2)
	(have_image Planet8 spectrograph3)
	(have_image Star9 spectrograph1)
))

)
