; params: satgen 171256 2 3 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	infrared0 - mode
	infrared2 - mode
	spectrograph1 - mode
	image3 - mode
	Star3 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	Star0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 Star0)
	(supports instrument2 infrared2)
	(supports instrument2 image3)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument3 spectrograph1)
	(calibration_target instrument3 Star4)
	(calibration_target instrument3 Star2)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite0 GroundStation5)
	(have_image Planet7 infrared2)
	(have_image Star8 infrared0)
))

)
