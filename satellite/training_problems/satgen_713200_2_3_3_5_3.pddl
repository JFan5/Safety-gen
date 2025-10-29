; params: satgen 713200 2 3 3 5 3
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
	image0 - mode
	spectrograph1 - mode
	thermograph2 - mode
	Star2 - direction
	Star4 - direction
	Star0 - direction
	GroundStation3 - direction
	Star1 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Star7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph2)
	(supports instrument2 image0)
	(calibration_target instrument2 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument3 thermograph2)
	(supports instrument3 spectrograph1)
	(supports instrument3 image0)
	(calibration_target instrument3 GroundStation3)
	(supports instrument4 thermograph2)
	(calibration_target instrument4 Star1)
	(supports instrument5 image0)
	(supports instrument5 spectrograph1)
	(supports instrument5 thermograph2)
	(calibration_target instrument5 Star1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 Planet6)
	(pointing satellite1 Planet6)
	(have_image Phenomenon5 spectrograph1)
	(have_image Planet6 spectrograph1)
	(have_image Star7 spectrograph1)
))

)
