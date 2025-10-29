; params: satgen 720207 2 2 3 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	infrared2 - mode
	spectrograph0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	GroundStation5 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument1 spectrograph1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(have_image Star7 spectrograph0)
	(have_image Phenomenon8 spectrograph0)
))

)
