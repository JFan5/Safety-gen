; params: satgen 348164 2 3 4 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	infrared3 - mode
	spectrograph2 - mode
	Star2 - direction
	Star4 - direction
	GroundStation6 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 Star3)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation5)
	(supports instrument2 infrared3)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
	(supports instrument3 spectrograph2)
	(calibration_target instrument3 GroundStation0)
	(calibration_target instrument3 GroundStation5)
	(supports instrument4 thermograph0)
	(supports instrument4 spectrograph2)
	(supports instrument4 spectrograph1)
	(calibration_target instrument4 GroundStation1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite0 GroundStation5)
	(have_image Planet7 infrared3)
	(have_image Phenomenon8 infrared3)
))

)
