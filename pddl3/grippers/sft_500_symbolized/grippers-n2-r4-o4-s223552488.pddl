(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_07 obj_01 obj_03 obj_09 - type_2
obj_13 obj_10 obj_12 obj_08 - type_3
obj_05 obj_11 obj_02 obj_14 - object)
(:init
(pred_1 obj_04 obj_13)
(pred_3 obj_04 obj_07)
(pred_3 obj_04 obj_01)
(pred_1 obj_06 obj_10)
(pred_3 obj_06 obj_03)
(pred_3 obj_06 obj_09)
(pred_2 obj_05 obj_12)
(pred_2 obj_11 obj_13)
(pred_2 obj_02 obj_12)
(pred_2 obj_14 obj_08)
)
(:goal
(and
(pred_2 obj_05 obj_13)
(pred_2 obj_11 obj_13)
(pred_2 obj_02 obj_12)
(pred_2 obj_14 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_12)))
)
)