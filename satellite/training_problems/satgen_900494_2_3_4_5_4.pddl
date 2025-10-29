; params: satgen 900494 2 3 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument4 - instrument
	spectrograph1 - mode
	image3 - mode
	infrared2 - mode
	image0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation4 - direction
	Star2 - direction
	GroundStation3 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 image3)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation4)
	(supports instrument3 infrared2)
	(supports instrument3 image3)
	(calibration_target instrument3 Star2)
	(supports instrument4 image3)
	(supports instrument4 infrared2)
	(supports instrument4 image0)
	(calibration_target instrument4 GroundStation3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite0 GroundStation0)
	(pointing satellite1 Planet8)
	(have_image Phenomenon5 spectrograph1)
	(have_image Planet6 spectrograph1)
	(have_image Planet7 image3)
	(have_image Planet8 image0)
))

)
