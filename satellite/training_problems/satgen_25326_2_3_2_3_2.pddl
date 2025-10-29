; params: satgen 25326 2 3 2 3 2
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
	image0 - mode
	spectrograph1 - mode
	Star1 - direction
	Star2 - direction
	Star0 - direction
	Planet3 - direction
	Planet4 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star1)
	(supports instrument2 spectrograph1)
	(supports instrument2 image0)
	(calibration_target instrument2 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet3)
	(supports instrument3 image0)
	(supports instrument3 spectrograph1)
	(calibration_target instrument3 Star2)
	(supports instrument4 spectrograph1)
	(supports instrument4 image0)
	(calibration_target instrument4 Star0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(have_image Planet3 spectrograph1)
	(have_image Planet4 spectrograph1)
))

)
