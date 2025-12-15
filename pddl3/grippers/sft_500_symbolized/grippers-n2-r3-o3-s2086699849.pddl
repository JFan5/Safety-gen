(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_1
obj_04 obj_10 obj_05 obj_08 - type_3
obj_01 obj_03 obj_12 - type_2
obj_06 obj_09 obj_07 - object)
(:init
(pred_3 obj_11 obj_03)
(pred_1 obj_11 obj_04)
(pred_1 obj_11 obj_10)
(pred_3 obj_02 obj_12)
(pred_1 obj_02 obj_05)
(pred_1 obj_02 obj_08)
(pred_4 obj_06 obj_12)
(pred_4 obj_09 obj_12)
(pred_4 obj_07 obj_12)
)
(:goal
(and
(pred_4 obj_06 obj_03)
(pred_4 obj_09 obj_01)
(pred_4 obj_07 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_12)))
)
)