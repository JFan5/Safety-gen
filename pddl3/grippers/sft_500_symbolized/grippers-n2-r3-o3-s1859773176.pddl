(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_06 - type_2
obj_04 obj_11 obj_09 obj_01 - type_3
obj_05 obj_03 obj_12 - type_1
obj_02 obj_08 obj_07 - object)
(:init
(pred_3 obj_10 obj_03)
(pred_4 obj_10 obj_04)
(pred_4 obj_10 obj_11)
(pred_3 obj_06 obj_03)
(pred_4 obj_06 obj_09)
(pred_4 obj_06 obj_01)
(pred_2 obj_02 obj_05)
(pred_2 obj_08 obj_03)
(pred_2 obj_07 obj_05)
)
(:goal
(and
(pred_2 obj_02 obj_05)
(pred_2 obj_08 obj_05)
(pred_2 obj_07 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_12)))
)
)