(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_3
obj_10 obj_08 obj_06 obj_11 - type_2
obj_07 obj_01 obj_12 obj_13 - type_1
obj_03 obj_02 obj_09 - object)
(:init
(pred_1 obj_05 obj_01)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_08)
(pred_1 obj_04 obj_01)
(pred_4 obj_04 obj_06)
(pred_4 obj_04 obj_11)
(pred_3 obj_03 obj_07)
(pred_3 obj_02 obj_12)
(pred_3 obj_09 obj_13)
)
(:goal
(and
(pred_3 obj_03 obj_13)
(pred_3 obj_02 obj_01)
(pred_3 obj_09 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_12)))
)
)