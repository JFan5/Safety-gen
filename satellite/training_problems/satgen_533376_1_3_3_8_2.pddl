; params: satgen 533376 1 3 3 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph2 - mode
	infrared1 - mode
	spectrograph0 - mode
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	Star2 - direction
	Star0 - direction
	GroundStation7 - direction
	Star1 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 Star2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation7)
	(supports instrument2 spectrograph0)
	(supports instrument2 infrared1)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(have_image Phenomenon8 spectrograph0)
	(have_image Planet9 spectrograph0)
))

)
