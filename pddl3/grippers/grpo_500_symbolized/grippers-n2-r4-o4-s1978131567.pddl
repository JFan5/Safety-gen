(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_1
obj_01 obj_11 obj_08 obj_10 - type_3
obj_05 obj_14 obj_04 obj_12 - type_2
obj_06 obj_13 obj_07 obj_02 - object)
(:init
(pred_3 obj_09 obj_12)
(pred_4 obj_09 obj_01)
(pred_4 obj_09 obj_11)
(pred_3 obj_03 obj_04)
(pred_4 obj_03 obj_08)
(pred_4 obj_03 obj_10)
(pred_2 obj_06 obj_12)
(pred_2 obj_13 obj_04)
(pred_2 obj_07 obj_05)
(pred_2 obj_02 obj_12)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_13 obj_14)
(pred_2 obj_07 obj_04)
(pred_2 obj_02 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_04)))
)
)