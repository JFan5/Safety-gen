; params: satgen 506738 1 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared2 - mode
	infrared0 - mode
	thermograph3 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Star12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 infrared0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 infrared2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 GroundStation7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(have_image Star8 infrared0)
	(have_image Planet9 infrared2)
	(have_image Phenomenon10 infrared0)
	(have_image Star11 thermograph3)
	(have_image Star12 spectrograph1)
	(have_image Planet13 infrared2)
))

)
