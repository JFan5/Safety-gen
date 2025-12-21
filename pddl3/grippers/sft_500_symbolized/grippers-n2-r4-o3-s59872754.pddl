(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_1
obj_08 obj_11 obj_03 obj_09 - type_2
obj_13 obj_06 obj_12 obj_10 - type_3
obj_01 obj_07 obj_04 - object)
(:init
(pred_1 obj_05 obj_06)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_11)
(pred_1 obj_02 obj_12)
(pred_3 obj_02 obj_03)
(pred_3 obj_02 obj_09)
(pred_2 obj_01 obj_10)
(pred_2 obj_07 obj_13)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_01 obj_13)
(pred_2 obj_07 obj_12)
(pred_2 obj_04 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_12)))
)
)