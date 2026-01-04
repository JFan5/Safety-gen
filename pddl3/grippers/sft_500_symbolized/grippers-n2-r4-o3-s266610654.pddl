(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_02 - type_3
obj_13 obj_06 obj_04 obj_03 - type_2
obj_01 obj_09 obj_12 obj_10 - type_1
obj_11 obj_05 obj_07 - object)
(:init
(pred_1 obj_08 obj_09)
(pred_4 obj_08 obj_13)
(pred_4 obj_08 obj_06)
(pred_1 obj_02 obj_10)
(pred_4 obj_02 obj_04)
(pred_4 obj_02 obj_03)
(pred_2 obj_11 obj_09)
(pred_2 obj_05 obj_01)
(pred_2 obj_07 obj_09)
)
(:goal
(and
(pred_2 obj_11 obj_12)
(pred_2 obj_05 obj_01)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_12)))
)
)