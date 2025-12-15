(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_3
obj_07 obj_03 obj_08 obj_13 - type_1
obj_01 obj_02 obj_06 obj_14 - type_2
obj_10 obj_05 obj_04 obj_11 - object)
(:init
(pred_1 obj_09 obj_14)
(pred_3 obj_09 obj_07)
(pred_3 obj_09 obj_03)
(pred_1 obj_12 obj_14)
(pred_3 obj_12 obj_08)
(pred_3 obj_12 obj_13)
(pred_2 obj_10 obj_02)
(pred_2 obj_05 obj_14)
(pred_2 obj_04 obj_14)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_05 obj_06)
(pred_2 obj_04 obj_01)
(pred_2 obj_11 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_06)))
)
)