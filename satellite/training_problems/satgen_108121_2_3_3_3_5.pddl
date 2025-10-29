; params: satgen 108121 2 3 3 3 5
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
	infrared2 - mode
	spectrograph1 - mode
	image0 - mode
	Star2 - direction
	Star1 - direction
	Star0 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared2)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(supports instrument2 image0)
	(supports instrument2 infrared2)
	(calibration_target instrument2 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument3 spectrograph1)
	(supports instrument3 infrared2)
	(supports instrument3 image0)
	(calibration_target instrument3 Star1)
	(supports instrument4 infrared2)
	(supports instrument4 spectrograph1)
	(calibration_target instrument4 Star1)
	(supports instrument5 image0)
	(calibration_target instrument5 Star0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet7)
)
(:goal (and
	(pointing satellite0 Star0)
	(pointing satellite1 Star1)
	(have_image Phenomenon3 spectrograph1)
	(have_image Planet4 image0)
	(have_image Star5 spectrograph1)
	(have_image Phenomenon6 infrared2)
	(have_image Planet7 spectrograph1)
))

)
