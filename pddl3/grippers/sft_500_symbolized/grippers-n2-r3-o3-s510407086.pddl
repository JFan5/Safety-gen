(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_3
obj_01 obj_05 obj_06 obj_08 - type_2
obj_09 obj_04 obj_12 - type_1
obj_11 obj_10 obj_03 - object)
(:init
(pred_2 obj_07 obj_09)
(pred_3 obj_07 obj_01)
(pred_3 obj_07 obj_05)
(pred_2 obj_02 obj_09)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_08)
(pred_1 obj_11 obj_09)
(pred_1 obj_10 obj_09)
(pred_1 obj_03 obj_12)
)
(:goal
(and
(pred_1 obj_11 obj_04)
(pred_1 obj_10 obj_12)
(pred_1 obj_03 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_12)))
)
)