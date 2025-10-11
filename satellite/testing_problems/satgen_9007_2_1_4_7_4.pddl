; params: satgen 9007 2 1 4 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	thermograph2 - mode
	spectrograph3 - mode
	spectrograph1 - mode
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	Star1 - direction
	Star3 - direction
	GroundStation0 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 image0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet9)
)
(:goal (and
	(pointing satellite0 Planet9)
	(have_image Planet7 image0)
	(have_image Phenomenon8 image0)
	(have_image Planet9 image0)
	(have_image Phenomenon10 image0)
))

)
