; params: satgen 816328 2 2 4 7 2
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
	spectrograph3 - mode
	thermograph1 - mode
	thermograph2 - mode
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star6 - direction
	Star0 - direction
	Star5 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 Star5)
	(supports instrument1 image0)
	(supports instrument1 spectrograph3)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 image0)
	(supports instrument2 spectrograph3)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 Star0)
	(supports instrument3 thermograph2)
	(calibration_target instrument3 Star5)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(pointing satellite0 Star6)
	(pointing satellite1 Phenomenon8)
	(have_image Star7 image0)
	(have_image Phenomenon8 spectrograph3)
))

)
