(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_08 - type_2
obj_05 obj_10 obj_03 obj_04 - type_1
obj_11 obj_06 obj_09 - type_3
obj_07 obj_02 obj_01 - object)
(:init
(pred_4 obj_12 obj_06)
(pred_1 obj_12 obj_05)
(pred_1 obj_12 obj_10)
(pred_4 obj_08 obj_11)
(pred_1 obj_08 obj_03)
(pred_1 obj_08 obj_04)
(pred_2 obj_07 obj_06)
(pred_2 obj_02 obj_06)
(pred_2 obj_01 obj_06)
)
(:goal
(and
(pred_2 obj_07 obj_09)
(pred_2 obj_02 obj_09)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_09)))
)
)