(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_09 - type_1
obj_01 obj_08 obj_10 obj_03 - type_3
obj_07 obj_02 obj_12 - type_2
obj_06 obj_11 obj_05 - object)
(:init
(pred_3 obj_04 obj_02)
(pred_1 obj_04 obj_01)
(pred_1 obj_04 obj_08)
(pred_3 obj_09 obj_07)
(pred_1 obj_09 obj_10)
(pred_1 obj_09 obj_03)
(pred_2 obj_06 obj_02)
(pred_2 obj_11 obj_02)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_06 obj_12)
(pred_2 obj_11 obj_12)
(pred_2 obj_05 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_12)))
)
)