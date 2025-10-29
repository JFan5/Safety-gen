; params: satgen 384984 2 3 2 3 3
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
	spectrograph1 - mode
	image0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Planet3 - direction
	Planet4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument3 spectrograph1)
	(supports instrument3 image0)
	(calibration_target instrument3 GroundStation2)
	(supports instrument4 spectrograph1)
	(calibration_target instrument4 GroundStation2)
	(supports instrument5 image0)
	(supports instrument5 spectrograph1)
	(calibration_target instrument5 GroundStation0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 Star5)
	(pointing satellite1 GroundStation0)
	(have_image Planet3 image0)
	(have_image Planet4 image0)
	(have_image Star5 spectrograph1)
))

)
