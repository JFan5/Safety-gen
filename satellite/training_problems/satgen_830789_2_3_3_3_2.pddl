; params: satgen 830789 2 3 3 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	infrared1 - mode
	spectrograph2 - mode
	image0 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Planet4 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star0)
	(supports instrument1 image0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star2)
	(supports instrument2 image0)
	(supports instrument2 infrared1)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument3 image0)
	(supports instrument3 infrared1)
	(supports instrument3 spectrograph2)
	(calibration_target instrument3 Star2)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Star3 infrared1)
	(have_image Planet4 image0)
))

)
