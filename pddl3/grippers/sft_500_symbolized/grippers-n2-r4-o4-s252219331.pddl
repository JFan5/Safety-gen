(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_03 - type_2
obj_08 obj_11 obj_09 obj_14 - type_1
obj_10 obj_12 obj_01 obj_04 - type_3
obj_05 obj_02 obj_13 obj_06 - object)
(:init
(pred_2 obj_07 obj_10)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_11)
(pred_2 obj_03 obj_04)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_14)
(pred_3 obj_05 obj_04)
(pred_3 obj_02 obj_10)
(pred_3 obj_13 obj_12)
(pred_3 obj_06 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_01)
(pred_3 obj_02 obj_10)
(pred_3 obj_13 obj_12)
(pred_3 obj_06 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_01)))
)
)