(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_1
obj_04 obj_13 obj_07 obj_09 - type_2
obj_02 obj_03 obj_06 obj_11 - type_3
obj_08 obj_01 obj_10 - object)
(:init
(pred_1 obj_12 obj_06)
(pred_3 obj_12 obj_04)
(pred_3 obj_12 obj_13)
(pred_1 obj_05 obj_06)
(pred_3 obj_05 obj_07)
(pred_3 obj_05 obj_09)
(pred_2 obj_08 obj_03)
(pred_2 obj_01 obj_11)
(pred_2 obj_10 obj_02)
)
(:goal
(and
(pred_2 obj_08 obj_11)
(pred_2 obj_01 obj_03)
(pred_2 obj_10 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_11)))
)
)