(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_13 - type_1
obj_08 obj_07 obj_06 obj_04 - type_3
obj_02 obj_12 obj_01 obj_05 - type_2
obj_03 obj_10 obj_11 - object)
(:init
(pred_3 obj_09 obj_01)
(pred_4 obj_09 obj_08)
(pred_4 obj_09 obj_07)
(pred_3 obj_13 obj_05)
(pred_4 obj_13 obj_06)
(pred_4 obj_13 obj_04)
(pred_2 obj_03 obj_12)
(pred_2 obj_10 obj_02)
(pred_2 obj_11 obj_12)
)
(:goal
(and
(pred_2 obj_03 obj_12)
(pred_2 obj_10 obj_05)
(pred_2 obj_11 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_05)))
)
)