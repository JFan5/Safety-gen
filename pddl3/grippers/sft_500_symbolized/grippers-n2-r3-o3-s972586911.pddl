(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_01 - type_1
obj_10 obj_09 obj_11 obj_05 - type_3
obj_07 obj_08 obj_02 - type_2
obj_12 obj_06 obj_03 - object)
(:init
(pred_1 obj_04 obj_08)
(pred_3 obj_04 obj_10)
(pred_3 obj_04 obj_09)
(pred_1 obj_01 obj_02)
(pred_3 obj_01 obj_11)
(pred_3 obj_01 obj_05)
(pred_2 obj_12 obj_07)
(pred_2 obj_06 obj_07)
(pred_2 obj_03 obj_08)
)
(:goal
(and
(pred_2 obj_12 obj_07)
(pred_2 obj_06 obj_02)
(pred_2 obj_03 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_02) (pred_1 obj_01 obj_02))))
  )
)
)