(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_03 - type_1
obj_13 obj_11 obj_06 obj_08 - type_3
obj_10 obj_02 obj_07 obj_05 - type_2
obj_01 obj_04 obj_09 obj_12 - object)
(:init
(pred_3 obj_14 obj_10)
(pred_4 obj_14 obj_13)
(pred_4 obj_14 obj_11)
(pred_3 obj_03 obj_07)
(pred_4 obj_03 obj_06)
(pred_4 obj_03 obj_08)
(pred_2 obj_01 obj_07)
(pred_2 obj_04 obj_02)
(pred_2 obj_09 obj_02)
(pred_2 obj_12 obj_02)
)
(:goal
(and
(pred_2 obj_01 obj_02)
(pred_2 obj_04 obj_02)
(pred_2 obj_09 obj_10)
(pred_2 obj_12 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_14 obj_02) (pred_3 obj_03 obj_02))))
  )
)
)