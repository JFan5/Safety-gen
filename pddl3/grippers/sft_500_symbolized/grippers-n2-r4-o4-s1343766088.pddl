(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_13 - type_1
obj_08 obj_14 obj_03 obj_02 - type_2
obj_10 obj_01 obj_12 obj_06 - type_3
obj_05 obj_04 obj_11 obj_09 - object)
(:init
(pred_2 obj_07 obj_12)
(pred_1 obj_07 obj_08)
(pred_1 obj_07 obj_14)
(pred_2 obj_13 obj_01)
(pred_1 obj_13 obj_03)
(pred_1 obj_13 obj_02)
(pred_4 obj_05 obj_01)
(pred_4 obj_04 obj_01)
(pred_4 obj_11 obj_12)
(pred_4 obj_09 obj_10)
)
(:goal
(and
(pred_4 obj_05 obj_10)
(pred_4 obj_04 obj_12)
(pred_4 obj_11 obj_06)
(pred_4 obj_09 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_06)))
)
)