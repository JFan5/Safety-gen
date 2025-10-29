; params: satgen 504381 2 3 3 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image0 - mode
	thermograph2 - mode
	spectrograph1 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 image0)
	(supports instrument2 thermograph2)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 spectrograph1)
	(supports instrument3 image0)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 Star4)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon6)
)
(:goal (and
	(have_image Planet5 spectrograph1)
	(have_image Phenomenon6 thermograph2)
))

)
