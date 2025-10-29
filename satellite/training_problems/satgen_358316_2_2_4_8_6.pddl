; params: satgen 358316 2 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared0 - mode
	thermograph3 - mode
	spectrograph1 - mode
	infrared2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star2 - direction
	GroundStation3 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Planet11 - direction
	Star12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 infrared0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 GroundStation7)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 infrared2)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph3)
	(calibration_target instrument2 GroundStation3)
	(calibration_target instrument2 Star2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(have_image Phenomenon8 infrared0)
	(have_image Phenomenon9 infrared0)
	(have_image Phenomenon10 infrared0)
	(have_image Planet11 infrared0)
	(have_image Star12 infrared0)
	(have_image Phenomenon13 spectrograph1)
))

)
