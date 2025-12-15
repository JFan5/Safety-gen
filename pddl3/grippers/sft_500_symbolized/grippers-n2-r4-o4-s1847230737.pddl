(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_2
obj_03 obj_07 obj_06 obj_12 - type_1
obj_02 obj_04 obj_09 obj_10 - type_3
obj_11 obj_14 obj_08 obj_05 - object)
(:init
(pred_4 obj_01 obj_02)
(pred_1 obj_01 obj_03)
(pred_1 obj_01 obj_07)
(pred_4 obj_13 obj_04)
(pred_1 obj_13 obj_06)
(pred_1 obj_13 obj_12)
(pred_2 obj_11 obj_04)
(pred_2 obj_14 obj_09)
(pred_2 obj_08 obj_09)
(pred_2 obj_05 obj_10)
)
(:goal
(and
(pred_2 obj_11 obj_02)
(pred_2 obj_14 obj_04)
(pred_2 obj_08 obj_10)
(pred_2 obj_05 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_09)))
)
)