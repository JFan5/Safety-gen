; params: satgen 435257 2 2 3 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	spectrograph2 - mode
	infrared1 - mode
	Star0 - direction
	Star2 - direction
	Star3 - direction
	Star1 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Phenomenon6)
	(have_image Phenomenon6 spectrograph2)
	(have_image Planet7 spectrograph2)
))

)
