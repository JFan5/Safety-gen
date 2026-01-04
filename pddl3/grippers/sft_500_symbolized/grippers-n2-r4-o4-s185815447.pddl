(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_2
obj_04 obj_13 obj_10 obj_08 - type_1
obj_11 obj_12 obj_06 obj_01 - type_3
obj_14 obj_05 obj_09 obj_07 - object)
(:init
(pred_2 obj_02 obj_12)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_13)
(pred_2 obj_03 obj_01)
(pred_3 obj_03 obj_10)
(pred_3 obj_03 obj_08)
(pred_1 obj_14 obj_12)
(pred_1 obj_05 obj_06)
(pred_1 obj_09 obj_12)
(pred_1 obj_07 obj_11)
)
(:goal
(and
(pred_1 obj_14 obj_06)
(pred_1 obj_05 obj_11)
(pred_1 obj_09 obj_12)
(pred_1 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_06)))
)
)