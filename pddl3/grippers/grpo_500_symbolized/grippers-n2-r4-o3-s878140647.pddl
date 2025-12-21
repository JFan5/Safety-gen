(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_1
obj_11 obj_07 obj_03 obj_10 - type_3
obj_09 obj_06 obj_12 obj_13 - type_2
obj_08 obj_01 obj_04 - object)
(:init
(pred_4 obj_02 obj_06)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_07)
(pred_4 obj_05 obj_13)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_10)
(pred_3 obj_08 obj_12)
(pred_3 obj_01 obj_13)
(pred_3 obj_04 obj_12)
)
(:goal
(and
(pred_3 obj_08 obj_09)
(pred_3 obj_01 obj_06)
(pred_3 obj_04 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_12)))
)
)