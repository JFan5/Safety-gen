; params: satgen 261339 2 3 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	spectrograph0 - mode
	thermograph1 - mode
	spectrograph3 - mode
	Star0 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	Star2 - direction
	Planet5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument1 spectrograph3)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star2)
	(supports instrument2 spectrograph0)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 Star2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(pointing satellite1 GroundStation1)
	(have_image Planet5 thermograph1)
	(have_image Planet6 spectrograph2)
))

)
