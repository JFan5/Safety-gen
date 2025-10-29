; params: satgen 130885 2 1 3 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	spectrograph2 - mode
	infrared0 - mode
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Star5 - direction
	GroundStation4 - direction
	Star1 - direction
	Star6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 infrared0)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(pointing satellite1 Planet9)
	(have_image Star6 infrared0)
	(have_image Planet7 spectrograph2)
	(have_image Phenomenon8 infrared0)
	(have_image Planet9 thermograph1)
))

)
