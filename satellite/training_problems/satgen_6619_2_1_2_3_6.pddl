; params: satgen 6619 2 1 2 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	Star2 - direction
	Star0 - direction
	Star1 - direction
	Planet3 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet4)
)
(:goal (and
	(have_image Planet3 spectrograph0)
	(have_image Planet4 spectrograph1)
	(have_image Star5 spectrograph1)
	(have_image Phenomenon6 spectrograph0)
	(have_image Planet7 spectrograph0)
	(have_image Planet8 spectrograph0)
))

)
