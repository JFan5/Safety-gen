(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_04 obj_12 obj_07 obj_11 - type_3
obj_13 obj_09 obj_01 obj_08 - type_2
obj_05 obj_14 obj_03 obj_06 - object)
(:init
(pred_3 obj_02 obj_01)
(pred_4 obj_02 obj_04)
(pred_4 obj_02 obj_12)
(pred_3 obj_10 obj_01)
(pred_4 obj_10 obj_07)
(pred_4 obj_10 obj_11)
(pred_2 obj_05 obj_01)
(pred_2 obj_14 obj_01)
(pred_2 obj_03 obj_01)
(pred_2 obj_06 obj_01)
)
(:goal
(and
(pred_2 obj_05 obj_13)
(pred_2 obj_14 obj_08)
(pred_2 obj_03 obj_13)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_08)))
)
)