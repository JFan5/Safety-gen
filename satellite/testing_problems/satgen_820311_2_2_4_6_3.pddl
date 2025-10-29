; params: satgen 820311 2 2 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph2 - mode
	spectrograph1 - mode
	image0 - mode
	infrared3 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	Star1 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star5)
	(supports instrument1 spectrograph1)
	(supports instrument1 infrared3)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument2 infrared3)
	(supports instrument2 spectrograph1)
	(supports instrument2 image0)
	(calibration_target instrument2 Star1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(pointing satellite1 GroundStation3)
	(have_image Phenomenon6 thermograph2)
	(have_image Star7 spectrograph1)
	(have_image Planet8 spectrograph1)
))

)
