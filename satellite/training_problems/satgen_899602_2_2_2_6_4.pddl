; params: satgen 899602 2 2 2 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star5 - direction
	GroundStation4 - direction
	Star0 - direction
	Star3 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star3)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite1 Star9)
	(have_image Star6 spectrograph0)
	(have_image Planet7 spectrograph1)
	(have_image Planet8 spectrograph0)
	(have_image Star9 spectrograph1)
))

)
