; params: satgen 554752 1 3 3 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	image0 - mode
	spectrograph2 - mode
	infrared1 - mode
	GroundStation0 - direction
	Star2 - direction
	GroundStation5 - direction
	Star6 - direction
	Star1 - direction
	Star4 - direction
	GroundStation3 - direction
	Planet7 - direction
	Planet8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 image0)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet10)
)
(:goal (and
	(pointing satellite0 Star6)
	(have_image Planet7 spectrograph2)
	(have_image Planet8 image0)
	(have_image Star9 infrared1)
	(have_image Planet10 spectrograph2)
))

)
