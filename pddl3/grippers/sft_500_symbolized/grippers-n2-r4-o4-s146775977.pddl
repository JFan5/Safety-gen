(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_03 obj_08 obj_04 obj_02 - type_3
obj_12 obj_10 obj_06 obj_13 - type_2
obj_14 obj_07 obj_05 obj_01 - object)
(:init
(pred_4 obj_11 obj_10)
(pred_1 obj_11 obj_03)
(pred_1 obj_11 obj_08)
(pred_4 obj_09 obj_12)
(pred_1 obj_09 obj_04)
(pred_1 obj_09 obj_02)
(pred_3 obj_14 obj_12)
(pred_3 obj_07 obj_13)
(pred_3 obj_05 obj_10)
(pred_3 obj_01 obj_13)
)
(:goal
(and
(pred_3 obj_14 obj_10)
(pred_3 obj_07 obj_06)
(pred_3 obj_05 obj_13)
(pred_3 obj_01 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_06)))
)
)