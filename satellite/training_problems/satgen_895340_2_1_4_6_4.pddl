; params: satgen 895340 2 1 4 6 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	spectrograph3 - mode
	spectrograph1 - mode
	thermograph2 - mode
	Star0 - direction
	GroundStation3 - direction
	Star5 - direction
	Star4 - direction
	Star2 - direction
	Star1 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
	(supports instrument1 spectrograph1)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(pointing satellite1 Phenomenon8)
	(have_image Planet6 infrared0)
	(have_image Phenomenon7 spectrograph1)
	(have_image Phenomenon8 thermograph2)
	(have_image Phenomenon9 thermograph2)
))

)
