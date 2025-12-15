(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_3
obj_07 obj_03 obj_10 obj_06 - type_2
obj_08 obj_01 obj_12 - type_1
obj_09 obj_05 obj_04 - object)
(:init
(pred_4 obj_11 obj_01)
(pred_3 obj_11 obj_07)
(pred_3 obj_11 obj_03)
(pred_4 obj_02 obj_08)
(pred_3 obj_02 obj_10)
(pred_3 obj_02 obj_06)
(pred_1 obj_09 obj_12)
(pred_1 obj_05 obj_12)
(pred_1 obj_04 obj_01)
)
(:goal
(and
(pred_1 obj_09 obj_08)
(pred_1 obj_05 obj_12)
(pred_1 obj_04 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_12)))
)
)