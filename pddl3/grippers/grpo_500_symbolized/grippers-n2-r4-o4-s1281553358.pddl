(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_13 - type_1
obj_04 obj_06 obj_11 obj_08 - type_3
obj_12 obj_07 obj_01 obj_14 - type_2
obj_09 obj_02 obj_05 obj_03 - object)
(:init
(pred_3 obj_10 obj_07)
(pred_4 obj_10 obj_04)
(pred_4 obj_10 obj_06)
(pred_3 obj_13 obj_14)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_08)
(pred_2 obj_09 obj_14)
(pred_2 obj_02 obj_01)
(pred_2 obj_05 obj_12)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_09 obj_01)
(pred_2 obj_02 obj_14)
(pred_2 obj_05 obj_01)
(pred_2 obj_03 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_01)))
)
)