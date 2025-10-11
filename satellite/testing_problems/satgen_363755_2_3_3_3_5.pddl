; params: satgen 363755 2 3 3 3 5
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
	instrument5 - instrument
	spectrograph2 - mode
	image0 - mode
	image1 - mode
	GroundStation1 - direction
	Star0 - direction
	Star2 - direction
	Planet3 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star2)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(supports instrument2 image1)
	(supports instrument2 spectrograph2)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument3 spectrograph2)
	(calibration_target instrument3 Star0)
	(supports instrument4 image0)
	(supports instrument4 image1)
	(supports instrument4 spectrograph2)
	(calibration_target instrument4 Star0)
	(supports instrument5 spectrograph2)
	(supports instrument5 image1)
	(supports instrument5 image0)
	(calibration_target instrument5 Star2)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet3)
)
(:goal (and
	(have_image Planet3 image0)
	(have_image Star4 image0)
	(have_image Planet5 spectrograph2)
	(have_image Phenomenon6 image0)
	(have_image Planet7 image0)
))

)
