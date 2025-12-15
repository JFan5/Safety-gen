(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_13 - type_1
obj_14 obj_01 obj_08 obj_04 - type_3
obj_06 obj_07 obj_02 obj_05 - type_2
obj_11 obj_03 obj_10 obj_09 - object)
(:init
(pred_3 obj_12 obj_02)
(pred_4 obj_12 obj_14)
(pred_4 obj_12 obj_01)
(pred_3 obj_13 obj_07)
(pred_4 obj_13 obj_08)
(pred_4 obj_13 obj_04)
(pred_2 obj_11 obj_07)
(pred_2 obj_03 obj_02)
(pred_2 obj_10 obj_06)
(pred_2 obj_09 obj_05)
)
(:goal
(and
(pred_2 obj_11 obj_05)
(pred_2 obj_03 obj_02)
(pred_2 obj_10 obj_06)
(pred_2 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_05)))
)
)