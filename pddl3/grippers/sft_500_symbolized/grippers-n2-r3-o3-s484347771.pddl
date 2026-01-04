(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_11 obj_08 obj_09 obj_03 - type_3
obj_04 obj_06 obj_12 - type_2
obj_05 obj_10 obj_02 - object)
(:init
(pred_2 obj_07 obj_06)
(pred_4 obj_07 obj_11)
(pred_4 obj_07 obj_08)
(pred_2 obj_01 obj_04)
(pred_4 obj_01 obj_09)
(pred_4 obj_01 obj_03)
(pred_3 obj_05 obj_04)
(pred_3 obj_10 obj_12)
(pred_3 obj_02 obj_12)
)
(:goal
(and
(pred_3 obj_05 obj_12)
(pred_3 obj_10 obj_12)
(pred_3 obj_02 obj_06)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_12)))
)
)