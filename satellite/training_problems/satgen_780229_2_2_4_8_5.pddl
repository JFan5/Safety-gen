; params: satgen 780229 2 2 4 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	spectrograph3 - mode
	infrared2 - mode
	spectrograph1 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	Star7 - direction
	Star2 - direction
	Star6 - direction
	GroundStation5 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Phenomenon11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument2 spectrograph1)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 Star6)
	(calibration_target instrument2 Star2)
	(supports instrument3 spectrograph3)
	(supports instrument3 infrared2)
	(supports instrument3 infrared0)
	(calibration_target instrument3 GroundStation5)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(pointing satellite1 Planet10)
	(have_image Planet8 spectrograph1)
	(have_image Phenomenon9 infrared2)
	(have_image Planet10 spectrograph1)
	(have_image Phenomenon11 infrared0)
	(have_image Star12 spectrograph3)
))

)
