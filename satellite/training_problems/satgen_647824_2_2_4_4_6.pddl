; params: satgen 647824 2 2 4 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph1 - mode
	image0 - mode
	spectrograph3 - mode
	spectrograph2 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument2 spectrograph3)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph2)
	(calibration_target instrument2 Star0)
	(supports instrument3 image0)
	(supports instrument3 spectrograph2)
	(calibration_target instrument3 GroundStation3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(have_image Star4 spectrograph2)
	(have_image Star5 thermograph1)
	(have_image Phenomenon6 spectrograph2)
	(have_image Planet7 thermograph1)
	(have_image Phenomenon8 thermograph1)
	(have_image Phenomenon9 spectrograph2)
))

)
