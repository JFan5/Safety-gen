(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_10 - type_2
obj_09 obj_07 obj_03 obj_02 - type_1
obj_11 obj_04 obj_12 obj_01 - type_3
obj_05 obj_06 obj_08 - object)
(:init
(pred_3 obj_13 obj_11)
(pred_2 obj_13 obj_09)
(pred_2 obj_13 obj_07)
(pred_3 obj_10 obj_04)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_02)
(pred_1 obj_05 obj_11)
(pred_1 obj_06 obj_11)
(pred_1 obj_08 obj_01)
)
(:goal
(and
(pred_1 obj_05 obj_01)
(pred_1 obj_06 obj_12)
(pred_1 obj_08 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_12)))
)
)