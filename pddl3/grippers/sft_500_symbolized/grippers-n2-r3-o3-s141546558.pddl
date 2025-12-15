(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_09 - type_1
obj_11 obj_04 obj_08 obj_10 - type_2
obj_05 obj_06 obj_12 - type_3
obj_02 obj_03 obj_07 - object)
(:init
(pred_4 obj_01 obj_06)
(pred_3 obj_01 obj_11)
(pred_3 obj_01 obj_04)
(pred_4 obj_09 obj_06)
(pred_3 obj_09 obj_08)
(pred_3 obj_09 obj_10)
(pred_2 obj_02 obj_06)
(pred_2 obj_03 obj_12)
(pred_2 obj_07 obj_12)
)
(:goal
(and
(pred_2 obj_02 obj_06)
(pred_2 obj_03 obj_05)
(pred_2 obj_07 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_12)))
)
)