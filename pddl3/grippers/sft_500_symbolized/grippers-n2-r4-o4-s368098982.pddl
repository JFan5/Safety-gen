(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_14 - type_1
obj_11 obj_10 obj_01 obj_02 - type_2
obj_08 obj_04 obj_06 obj_05 - type_3
obj_12 obj_09 obj_07 obj_13 - object)
(:init
(pred_1 obj_03 obj_04)
(pred_3 obj_03 obj_11)
(pred_3 obj_03 obj_10)
(pred_1 obj_14 obj_04)
(pred_3 obj_14 obj_01)
(pred_3 obj_14 obj_02)
(pred_2 obj_12 obj_08)
(pred_2 obj_09 obj_05)
(pred_2 obj_07 obj_06)
(pred_2 obj_13 obj_04)
)
(:goal
(and
(pred_2 obj_12 obj_06)
(pred_2 obj_09 obj_04)
(pred_2 obj_07 obj_04)
(pred_2 obj_13 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_06)))
)
)