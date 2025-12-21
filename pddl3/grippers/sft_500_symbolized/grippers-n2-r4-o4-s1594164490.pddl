(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_1
obj_02 obj_12 obj_13 obj_01 - type_2
obj_14 obj_10 obj_03 obj_06 - type_3
obj_09 obj_05 obj_07 obj_04 - object)
(:init
(pred_1 obj_08 obj_03)
(pred_3 obj_08 obj_02)
(pred_3 obj_08 obj_12)
(pred_1 obj_11 obj_14)
(pred_3 obj_11 obj_13)
(pred_3 obj_11 obj_01)
(pred_2 obj_09 obj_10)
(pred_2 obj_05 obj_10)
(pred_2 obj_07 obj_14)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_09 obj_06)
(pred_2 obj_05 obj_06)
(pred_2 obj_07 obj_03)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_06)))
)
)