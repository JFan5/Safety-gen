; params: satgen 691781 1 1 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	spectrograph3 - mode
	thermograph1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star7 - direction
	Star6 - direction
	Star4 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Planet10 - direction
	Phenomenon11 - direction
	Star12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star12)
)
(:goal (and
	(have_image Phenomenon8 thermograph0)
	(have_image Planet9 thermograph1)
	(have_image Planet10 spectrograph3)
	(have_image Phenomenon11 infrared2)
	(have_image Star12 thermograph1)
	(have_image Planet13 spectrograph3)
))

)
