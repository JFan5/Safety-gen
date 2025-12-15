(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_09 - type_1
obj_08 obj_11 obj_03 obj_04 - type_2
obj_05 obj_06 obj_01 obj_12 - type_3
obj_14 obj_13 obj_07 obj_10 - object)
(:init
(pred_3 obj_02 obj_01)
(pred_1 obj_02 obj_08)
(pred_1 obj_02 obj_11)
(pred_3 obj_09 obj_12)
(pred_1 obj_09 obj_03)
(pred_1 obj_09 obj_04)
(pred_4 obj_14 obj_01)
(pred_4 obj_13 obj_06)
(pred_4 obj_07 obj_01)
(pred_4 obj_10 obj_12)
)
(:goal
(and
(pred_4 obj_14 obj_12)
(pred_4 obj_13 obj_12)
(pred_4 obj_07 obj_01)
(pred_4 obj_10 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_12)))
)
)