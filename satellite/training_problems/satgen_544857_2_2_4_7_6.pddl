; params: satgen 544857 2 2 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph0 - mode
	thermograph2 - mode
	infrared1 - mode
	spectrograph3 - mode
	GroundStation0 - direction
	Star1 - direction
	Star6 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Star2 - direction
	Planet7 - direction
	Planet8 - direction
	Planet9 - direction
	Star10 - direction
	Planet11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument2 infrared1)
	(supports instrument2 spectrograph0)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon12)
)
(:goal (and
	(have_image Planet7 thermograph2)
	(have_image Planet8 infrared1)
	(have_image Planet9 spectrograph0)
	(have_image Star10 spectrograph0)
	(have_image Planet11 infrared1)
	(have_image Phenomenon12 infrared1)
))

)
