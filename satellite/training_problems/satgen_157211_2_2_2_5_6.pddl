; params: satgen 157211 2 2 2 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared0 - mode
	spectrograph1 - mode
	Star2 - direction
	GroundStation4 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	GroundStation3 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument2 infrared0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 infrared0)
	(calibration_target instrument3 GroundStation3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(have_image Planet5 spectrograph1)
	(have_image Phenomenon6 infrared0)
	(have_image Planet7 spectrograph1)
	(have_image Planet8 infrared0)
	(have_image Phenomenon9 spectrograph1)
	(have_image Planet10 infrared0)
))

)
