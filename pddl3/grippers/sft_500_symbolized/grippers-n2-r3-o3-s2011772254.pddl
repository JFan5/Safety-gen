(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_07 - type_1
obj_04 obj_02 obj_11 obj_06 - type_2
obj_08 obj_03 obj_12 - type_3
obj_01 obj_05 obj_10 - object)
(:init
(pred_1 obj_09 obj_08)
(pred_3 obj_09 obj_04)
(pred_3 obj_09 obj_02)
(pred_1 obj_07 obj_08)
(pred_3 obj_07 obj_11)
(pred_3 obj_07 obj_06)
(pred_2 obj_01 obj_08)
(pred_2 obj_05 obj_03)
(pred_2 obj_10 obj_12)
)
(:goal
(and
(pred_2 obj_01 obj_03)
(pred_2 obj_05 obj_12)
(pred_2 obj_10 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_12)))
)
)