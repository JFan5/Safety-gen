; params: satgen 374093 2 2 4 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph1 - mode
	image2 - mode
	infrared3 - mode
	thermograph0 - mode
	GroundStation4 - direction
	GroundStation0 - direction
	Star6 - direction
	Star1 - direction
	GroundStation3 - direction
	Star5 - direction
	Star2 - direction
	Phenomenon7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation3)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument2 spectrograph1)
	(supports instrument2 infrared3)
	(supports instrument2 image2)
	(calibration_target instrument2 Star2)
	(calibration_target instrument2 Star5)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(have_image Phenomenon7 image2)
	(have_image Star8 spectrograph1)
	(have_image Phenomenon9 infrared3)
	(have_image Star10 image2)
))

)
