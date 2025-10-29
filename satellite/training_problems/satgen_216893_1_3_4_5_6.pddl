; params: satgen 216893 1 3 4 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	spectrograph1 - mode
	infrared3 - mode
	infrared0 - mode
	infrared2 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star0 - direction
	Star3 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Star5 infrared2)
	(have_image Planet6 spectrograph1)
	(have_image Phenomenon7 spectrograph1)
	(have_image Star8 infrared2)
	(have_image Phenomenon9 infrared2)
	(have_image Phenomenon10 infrared2)
))

)
