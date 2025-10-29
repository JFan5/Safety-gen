; params: satgen 255662 2 3 4 6 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	infrared0 - mode
	thermograph3 - mode
	spectrograph2 - mode
	infrared1 - mode
	GroundStation5 - direction
	Star1 - direction
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Star6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 infrared0)
	(calibration_target instrument2 GroundStation2)
	(calibration_target instrument2 Star0)
	(supports instrument3 spectrograph2)
	(supports instrument3 thermograph3)
	(calibration_target instrument3 Star4)
	(calibration_target instrument3 Star3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(pointing satellite0 Star1)
	(pointing satellite1 Star1)
	(have_image Star6 spectrograph2)
	(have_image Phenomenon7 infrared1)
	(have_image Star8 infrared1)
))

)
