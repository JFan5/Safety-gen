; params: satgen 423111 1 3 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph2 - mode
	thermograph1 - mode
	image0 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star3 - direction
	Star6 - direction
	GroundStation7 - direction
	Star4 - direction
	Star5 - direction
	Planet8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
)
(:goal (and
	(pointing satellite0 Planet9)
	(have_image Planet8 spectrograph2)
	(have_image Planet9 spectrograph2)
	(have_image Phenomenon10 spectrograph2)
	(have_image Star11 spectrograph2)
	(have_image Phenomenon12 thermograph1)
))

)
