; params: satgen 808830 2 3 3 4 4
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
	infrared2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star2 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star3)
	(supports instrument3 spectrograph0)
	(supports instrument3 spectrograph1)
	(supports instrument3 infrared2)
	(calibration_target instrument3 Star2)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Star4 spectrograph1)
	(have_image Star5 infrared2)
	(have_image Planet6 infrared2)
	(have_image Phenomenon7 spectrograph1)
))

)
