(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_1
obj_11 obj_01 obj_05 obj_06 - type_2
obj_07 obj_04 obj_08 obj_02 - type_3
obj_10 obj_14 obj_12 obj_13 - object)
(:init
(pred_1 obj_03 obj_02)
(pred_3 obj_03 obj_11)
(pred_3 obj_03 obj_01)
(pred_1 obj_09 obj_04)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_06)
(pred_2 obj_10 obj_02)
(pred_2 obj_14 obj_07)
(pred_2 obj_12 obj_08)
(pred_2 obj_13 obj_04)
)
(:goal
(and
(pred_2 obj_10 obj_04)
(pred_2 obj_14 obj_07)
(pred_2 obj_12 obj_04)
(pred_2 obj_13 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_03 obj_02) (pred_1 obj_09 obj_02))))
  )
)
)