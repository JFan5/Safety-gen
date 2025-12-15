(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_03 - type_2
obj_09 obj_11 obj_06 obj_04 - type_3
obj_13 obj_02 obj_08 obj_12 - type_1
obj_01 obj_07 obj_10 - object)
(:init
(pred_4 obj_05 obj_08)
(pred_1 obj_05 obj_09)
(pred_1 obj_05 obj_11)
(pred_4 obj_03 obj_08)
(pred_1 obj_03 obj_06)
(pred_1 obj_03 obj_04)
(pred_2 obj_01 obj_13)
(pred_2 obj_07 obj_13)
(pred_2 obj_10 obj_13)
)
(:goal
(and
(pred_2 obj_01 obj_12)
(pred_2 obj_07 obj_13)
(pred_2 obj_10 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_12)))
)
)