(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_1
obj_09 obj_04 obj_02 obj_11 - type_2
obj_05 obj_01 obj_12 obj_03 - type_3
obj_07 obj_06 obj_13 - object)
(:init
(pred_1 obj_10 obj_03)
(pred_3 obj_10 obj_09)
(pred_3 obj_10 obj_04)
(pred_1 obj_08 obj_12)
(pred_3 obj_08 obj_02)
(pred_3 obj_08 obj_11)
(pred_2 obj_07 obj_05)
(pred_2 obj_06 obj_01)
(pred_2 obj_13 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_12)
(pred_2 obj_06 obj_12)
(pred_2 obj_13 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_12)))
)
)