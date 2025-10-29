; params: satgen 917973 1 2 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph3 - mode
	spectrograph2 - mode
	image1 - mode
	image0 - mode
	Star0 - direction
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation1 - direction
	Star3 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(supports instrument0 image1)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph3)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Planet8 image0)
	(have_image Phenomenon9 spectrograph3)
	(have_image Phenomenon10 spectrograph3)
))

)
