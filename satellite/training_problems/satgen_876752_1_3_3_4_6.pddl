; params: satgen 876752 1 3 3 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	image1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	GroundStation3 - direction
	Star2 - direction
	GroundStation1 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star2)
	(supports instrument1 image1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(have_image Star4 image1)
	(have_image Star5 image1)
	(have_image Planet6 spectrograph0)
	(have_image Planet7 spectrograph0)
	(have_image Planet8 image1)
	(have_image Phenomenon9 image1)
))

)
