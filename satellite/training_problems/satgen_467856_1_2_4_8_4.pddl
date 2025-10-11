; params: satgen 467856 1 2 4 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph0 - mode
	thermograph3 - mode
	spectrograph2 - mode
	image1 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	GroundStation6 - direction
	Star4 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 GroundStation6)
	(supports instrument1 spectrograph0)
	(supports instrument1 image1)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
)
(:goal (and
	(have_image Planet8 image1)
	(have_image Phenomenon9 spectrograph0)
	(have_image Phenomenon10 image1)
	(have_image Phenomenon11 image1)
))

)
