(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_01 - type_1
obj_10 obj_04 obj_09 obj_11 - type_2
obj_03 obj_12 obj_06 obj_14 - type_3
obj_05 obj_07 obj_08 obj_13 - object)
(:init
(pred_2 obj_02 obj_14)
(pred_3 obj_02 obj_10)
(pred_3 obj_02 obj_04)
(pred_2 obj_01 obj_06)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_11)
(pred_4 obj_05 obj_12)
(pred_4 obj_07 obj_12)
(pred_4 obj_08 obj_06)
(pred_4 obj_13 obj_03)
)
(:goal
(and
(pred_4 obj_05 obj_14)
(pred_4 obj_07 obj_06)
(pred_4 obj_08 obj_03)
(pred_4 obj_13 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_06)))
)
)