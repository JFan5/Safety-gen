(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_11 - type_1
obj_04 obj_07 obj_05 obj_06 - type_2
obj_10 obj_03 obj_12 - type_3
obj_08 obj_09 obj_02 - object)
(:init
(pred_1 obj_01 obj_03)
(pred_3 obj_01 obj_04)
(pred_3 obj_01 obj_07)
(pred_1 obj_11 obj_12)
(pred_3 obj_11 obj_05)
(pred_3 obj_11 obj_06)
(pred_2 obj_08 obj_10)
(pred_2 obj_09 obj_12)
(pred_2 obj_02 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_09 obj_12)
(pred_2 obj_02 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_12)))
)
)