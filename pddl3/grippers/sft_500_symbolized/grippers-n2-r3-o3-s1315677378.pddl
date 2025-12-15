(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_2
obj_06 obj_07 obj_05 obj_04 - type_1
obj_09 obj_02 obj_03 - type_3
obj_11 obj_08 obj_10 - object)
(:init
(pred_3 obj_12 obj_09)
(pred_2 obj_12 obj_06)
(pred_2 obj_12 obj_07)
(pred_3 obj_01 obj_09)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_04)
(pred_1 obj_11 obj_03)
(pred_1 obj_08 obj_09)
(pred_1 obj_10 obj_02)
)
(:goal
(and
(pred_1 obj_11 obj_09)
(pred_1 obj_08 obj_09)
(pred_1 obj_10 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_03)))
)
)