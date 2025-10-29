; params: satgen 297047 2 2 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	Star2 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star10)
)
(:goal (and
	(have_image Phenomenon7 thermograph1)
	(have_image Phenomenon8 spectrograph0)
	(have_image Planet9 spectrograph0)
	(have_image Star10 thermograph1)
))

)
