; params: satgen 298881 2 3 3 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	thermograph1 - mode
	spectrograph2 - mode
	image0 - mode
	Star0 - direction
	Star2 - direction
	Star1 - direction
	Star3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Star6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star1)
	(supports instrument2 thermograph1)
	(supports instrument2 image0)
	(calibration_target instrument2 Star2)
	(supports instrument3 thermograph1)
	(supports instrument3 spectrograph2)
	(supports instrument3 image0)
	(calibration_target instrument3 Star1)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 Planet7)
	(have_image Star3 spectrograph2)
	(have_image Planet4 image0)
	(have_image Phenomenon5 thermograph1)
	(have_image Star6 image0)
	(have_image Planet7 spectrograph2)
	(have_image Star8 thermograph1)
))

)
