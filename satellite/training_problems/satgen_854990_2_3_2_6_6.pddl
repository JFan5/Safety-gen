; params: satgen 854990 2 3 2 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared0 - mode
	spectrograph1 - mode
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	Star4 - direction
	GroundStation1 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph1)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
	(supports instrument2 infrared0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon7)
)
(:goal (and
	(pointing satellite0 Star9)
	(have_image Planet6 spectrograph1)
	(have_image Phenomenon7 infrared0)
	(have_image Planet8 infrared0)
	(have_image Star9 spectrograph1)
	(have_image Star10 spectrograph1)
	(have_image Planet11 infrared0)
))

)
