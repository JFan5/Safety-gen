; params: satgen 394509 2 3 3 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	thermograph2 - mode
	GroundStation1 - direction
	GroundStation5 - direction
	Star3 - direction
	Star4 - direction
	Star0 - direction
	Star2 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument2 thermograph2)
	(supports instrument2 spectrograph1)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation5)
	(calibration_target instrument2 Star0)
	(supports instrument3 spectrograph0)
	(calibration_target instrument3 Star4)
	(calibration_target instrument3 Star3)
	(supports instrument4 thermograph2)
	(supports instrument4 spectrograph1)
	(calibration_target instrument4 Star2)
	(calibration_target instrument4 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Star6)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 spectrograph1)
))

)
